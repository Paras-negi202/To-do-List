const dateElement = document.getElementById('date');
const clear = document.querySelector('.clear');
const list = document.getElementById('list');
const input = document.querySelector('input');
const addButton = document.querySelector('.fa-plus-circle');

const CHECK = "fa-check-circle";
const UNCHECK = "fa-circle-thin";
const LINE_THROUGH = "lineThrough";
const CHANGE = "editable";

var timer = null, delay = 260, click = 0, canFocus = true;

clear.addEventListener("click", function () {
    localStorage.clear();
    location.reload();
});
/* show time */
const options = { weekday: 'long', month: 'short', day: 'numeric' };
const today = new Date();
dateElement.innerHTML = today.toLocaleDateString("en-US", options);

let LIST, id;
let data = localStorage.getItem("TODO");
//get historical data from localstorage
if (data) {
    LIST = JSON.parse(data);
    id = LIST.length;
    loadList(LIST);
}
else {
    LIST = []
    id = 0;
}

function loadList(array) {
    array.forEach(element => {
        add_to_do(element.name, element.id, element.done, element.trash);
    });
}

function add_to_do(toDo, id, done, trash) {
    if (trash)
        return;
    const DONE = done ? CHECK : UNCHECK;
    const LINE = done ? LINE_THROUGH : "";

    const item = `<li class="item">
                    <i class="fa ${DONE} co" job="complete" id="${id}"></i>
                    <input class="text ${LINE}" job="edit" value="${toDo}" id="${id}" Blur=""">
                    <i class="fa fa-trash-o de" job="delete" id="${id}"></i>
                </li>
                `;
    const position = "beforeend";
    list.insertAdjacentHTML(position, item);
}

input.addEventListener("keypress", function (even) {
    if (event.keyCode === 13) {
        const toDo = input.value;
        if (toDo) {
            add_to_do(toDo, id, false, false);

            LIST.push({ name: toDo, id: id, done: false, trash: false });

            localStorage.setItem("TODO", JSON.stringify(LIST));
            id++;
            input.value = "";
        }
    }
});

addButton.addEventListener('click', function () {
    const toDo = input.value;
    if (toDo) {
        add_to_do(toDo, id, false, false);

        LIST.push({ name: toDo, id: id, done: false, trash: false });

        localStorage.setItem("TODO", JSON.stringify(LIST));
        id++;
        input.value = "";
    }
});

list.addEventListener("click", function (event) {
    const element = event.target;
    const elementJob = element.attributes.job.value;

    if (elementJob === 'complete') {
        completeToDo(element);
    } else if (elementJob === 'delete') {
        removeToDo(element);
    }
    else if(elementJob === 'edit'){
        editTodo(element);
    }

    localStorage.setItem("TODO", JSON.stringify(LIST));

}, false);

function completeToDo(element) {
    element.classList.toggle(UNCHECK);
    element.classList.toggle(CHECK);
    element.parentNode.querySelector(".text").classList.toggle(LINE_THROUGH);

    LIST[element.id].done = LIST[element.id].done ? false : true;
}

function removeToDo(element) {
    element.parentNode.parentNode.removeChild(element.parentNode);
    LIST[element.id].trash = true;
}

function editTodo(element){
    var newTodo, content = element.parentNode.querySelector(".text");
    if(canFocus)
        content.blur();
    click++;
    if(click === 1){
        timer = setTimeout(function(){
            click = 0;
        }, (delay));
    } else{
        click = 0;
        canFocus = false;
        clearTimeout(timer);
        content.focus();
        content.onblur = ()=>{
            newTodo = content.value;
            LIST[element.id].name = newTodo;
            localStorage.setItem("TODO",JSON.stringify(LIST));
            canFocus = true;
        };
    }

}