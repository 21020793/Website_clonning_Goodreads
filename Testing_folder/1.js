const currentUser = {
	image: "./images/avatars/image-juliusomo.webp",
	username: localStorage.getItem("username"),
};
const comments = [];
const user_review = {};

function appendFrag(frag, parent) {
	var children = [].slice.call(frag.childNodes, 0);
	parent.appendChild(frag);
	return children[1];
}

const addComment = async (body, parentId, replyTo = undefined) => {
	const type = parentId === 0 ? "review" : "comment";
	const book_id = localStorage.getItem("bookId");
	const content = body;
	const rating = localStorage.getItem("rating");
	const parent_comment_id = parentId;
	const url = "Testing_folder/add_comment.php";
	const params = 'type=' + type + '&book_id=' + book_id + '&content=' + content + '&rating=' + rating + '&parent_comment_id=' + parent_comment_id;
	console.log(params);
	try {
		const response = await fetch(url, {
			method: "POST",
			body: params,
			headers: {
				"Content-type": "application/x-www-form-urlencoded",
			},
		});
		if (!response.ok) throw new Error("Error adding comment");
		await getReviewsByBookId(bookId);
	} catch (error) {
		console.log(error);
	}
};
const deleteComment = async (commentObject) => {

	const url = "Testing_folder/delete_review.php";
	const params = 'review_id=' + commentObject.id + '&id' + localStorage.getItem("id");

	try {
		const response = await fetch(url, {
			method: "POST",
			body: params,
			headers: {
				"Content-type": "application/x-www-form-urlencoded",
			},
		});
		if (!response.ok) throw new Error("Error adding comment");
		await getReviewsByBookId(bookId);
	} catch (error) {
		console.log(error);
	}
};

const updateComment = async (commentId, content) => {
	const url = "Testing_folder/update_comment.php";
	const params = 'review_id=' + commentId + '&content=' + content + '&account_id=' + localStorage.getItem("id") + '&rating=' + localStorage.getItem("rating");
	console.log(params);

	try {
		const response = await fetch(url, {
			method: "POST",
			body: params,
			headers: {
				"Content-type": "application/x-www-form-urlencoded",
			},
		});
		if (!response.ok) throw new Error("Error updating comment");
		await getReviewsByBookId(bookId);
		console.log(response);
	} catch (error) {
		console.log(error);
	}
};


const promptDel = (commentObject) => {
	const modalWrp = document.querySelector(".modal-wrp");
	modalWrp.classList.remove("invisible");
	modalWrp.querySelector(".yes").addEventListener("click", () => {
		deleteComment(commentObject);
		modalWrp.classList.add("invisible");
	});
	modalWrp.querySelector(".no").addEventListener("click", () => {
		modalWrp.classList.add("invisible");
	});
};

const spawnReplyInput = (parent, parentId, replyTo = undefined) => {
	if (parent.querySelectorAll(".reply-input")) {
		parent.querySelectorAll(".reply-input").forEach((e) => {
			e.remove();
		});
	}
	const inputTemplate = document.querySelector(".reply-input-template");
	const inputNode = inputTemplate.content.cloneNode(true);
	const addedInput = appendFrag(inputNode, parent);
	addedInput.querySelector(".bu-primary").addEventListener("click", () => {
		let commentBody = addedInput.querySelector(".cmnt-input").value;
		if (commentBody.length == 0) return;
		addComment(commentBody, parentId, replyTo);
	});
};

const createCommentNode = (commentObject) => {
	const commentTemplate = document.querySelector(".comment-template");
	var commentNode = commentTemplate.content.cloneNode(true);
	commentNode.querySelector(".usr-name").textContent =
		commentObject.user.username;
	commentNode.querySelector(".usr-img").src = commentObject.user.image;
	commentNode.querySelector(".score-number").textContent = commentObject.score;
	commentNode.querySelector(".cmnt-at").textContent = commentObject.createdAt;
	commentNode.querySelector(".c-body").textContent = commentObject.content;
	if (commentObject.replyingTo)
		commentNode.querySelector(".reply-to").textContent =
			"@" + commentObject.replyingTo;

	commentNode.querySelector(".score-plus").addEventListener("click", () => {
		commentObject.score++;
		initComments();
	});

	commentNode.querySelector(".score-minus").addEventListener("click", () => {
		commentObject.score--;
		if (commentObject.score < 0) commentObject.score = 0;
		initComments();
	});
	if (commentObject.user.username == currentUser.username) {
		commentNode.querySelector(".comment").classList.add("this-user");
		commentNode.querySelector(".delete").addEventListener("click", () => {
			promptDel(commentObject);
		});
		commentNode.querySelector(".edit").addEventListener("click", (e) => {
			const commentElement = e.target.closest(".comment");
			const path = commentElement.querySelector(".c-body");
			const originalContent = path.textContent;
			const isEditing = path.getAttribute("contenteditable") === "true";
			if (!isEditing) {
				path.setAttribute("contenteditable", true);
				path.focus();

				// Hiển thị nút submit
				const submitButton = document.createElement("button");
				submitButton.classList.add("submit");
				submitButton.textContent = "Submit";
				commentElement.appendChild(submitButton);

				// Xử lý sự kiện khi người dùng nhấn vào nút submit
				submitButton.addEventListener("click", () => {
					const updatedContent = path.textContent;
					if (originalContent !== updatedContent) {
						path.setAttribute("contenteditable", false);
						updateComment(commentObject.id, updatedContent);

						// Xóa nút submit sau khi cập nhật thành công
						commentElement.removeChild(submitButton);
					}
				});
			} else {
				const updatedContent = path.textContent;
				if (originalContent !== updatedContent) {
					path.setAttribute("contenteditable", false);
					updateComment(commentObject.id, updatedContent);
				}
			}
		});


		return commentNode;
	}
	return commentNode;
};

const appendComment = (parentNode, commentNode, parentId) => {
	const bu_reply = commentNode.querySelector(".reply");
	// parentNode.appendChild(commentNode);
	const appendedCmnt = appendFrag(commentNode, parentNode);
	const replyTo = appendedCmnt.querySelector(".usr-name").textContent;
	bu_reply.addEventListener("click", () => {
		if (parentNode.classList.contains("replies")) {
			spawnReplyInput(parentNode, parentId, replyTo);
		} else {
			spawnReplyInput(
				appendedCmnt.querySelector(".replies"),
				parentId,
				replyTo
			);
		}
	});
};

function initComments(
	commentList = comments,
	parent = document.querySelector(".comments-wrp")
) {
	parent.innerHTML = "";
	commentList.forEach((element) => {
		var parentId = element.parent == 0 ? element.id : element.parent;
		const comment_node = createCommentNode(element);
		if (element.replies && element.replies.length > 0) {
			initComments(element.replies, comment_node.querySelector(".replies"));
		}
		appendComment(parent, comment_node, parentId);
	});
}

// getReviewsByBookId(1);


const cmntInput = document.querySelector(".reply-input");
cmntInput.querySelector(".bu-primary").addEventListener("click", () => {
	let commentBody = cmntInput.querySelector(".cmnt-input").value;
	if (commentBody.length == 0) return;
	addComment(commentBody, 0);
	cmntInput.querySelector(".cmnt-input").value = "";
});

async function getReviewsByBookId(book_id) {
	const url = "Testing_folder/get_comments.php";
	const params = 'type=book&id=' + book_id + '&comment_limit=' + 1000;

	try {
		const response = await fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded",
			},
			body: params,
		});

		if (!response.ok) {
			throw new Error("Error: " + response.status);
		}
		const data = await response.json();
		if (data == "fail") {
			return;
		}
		comments.length = 0;
		data.forEach((element) => {
			comments.push(element);
		});
		initComments();
	} catch (error) {
		console.log(error);
	}
}

getReviewsByBookId(bookId);

async function getUserReviews(book_id) {
	const url = "Testing_folder/get_comments.php";
	const params = 'type=review_user&id=' + book_id + '&comment_limit=' + 1;

	try {
		const response = await fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded",
			},
			body: params,
		});

		if (!response.ok) {
			throw new Error("Error: " + response.status);
		}
		const data = await response.json();
		if (data == "fail") {
			return;
		}
		user_review = await response.json();
		
	} catch (error) {
		console.log(error);
	}
};