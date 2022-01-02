function ready() {
  var skillsList = $("ul#skills")[0]

  if (skillsList) {
    var skillInput = $("#skill")[0]
    var addSkillButton = $("#add_skill")[0]
    var submitButton = $("input[type='submit']")[0]
    var resultsList = $("#search_results")[0]
    var request = new XMLHttpRequest();

    skillInput.addEventListener("input", (e) => { 
      $(resultsList).empty()
      var url = "/skills/search?title=" + e.target.value
      request.open('GET', url)
      request.send()
    })

    addSkillButton.addEventListener("click", (e) => {
      e.preventDefault()
      appendTag(skillsList, skillInput)
    })

    submitButton.addEventListener("click", (e) => {
      addHiddenField(skillsList)
    })

    request.addEventListener("readystatechange", () => { 
      if (request.readyState === 4 && request.status === 200) { listResults(resultsList, request.responseText) }
    })
  }
}

function searchTag(resultsList, e) {

}

function listResults(resultsList, response) {
  var results = JSON.parse(response)
  for (i = 0; i < results.length; i++) { 
    var newTag = document.createElement("li");
    newTag.appendChild(document.createTextNode(results[i].title));
    resultsList.appendChild(newTag)
  }
}

function appendTag(list, input) {
  if (input.value == "") { alert("Can't be blank!") } 
    else if ( tagsArray(list).indexOf(input.value) >= 0 ) { alert(`Already in the list (${input.value})!`) } 
      else {
        // append new tag
        var newTag = document.createElement("li");
        newTag.appendChild(document.createTextNode(input.value));
        list.appendChild(newTag)
      
        // clear input
        input.value = ''
      }
}

function addHiddenField(list) {
  const hiddenField = document.createElement('input')
  hiddenField.setAttribute("type", "hidden");
  hiddenField.setAttribute("value", tagsArray(list));
  hiddenField.name = "vacancy[skill_list]"
  list.appendChild(hiddenField)
}

function tagsArray(list) {
  var tagsElements = $(list).children().toArray()
  var tags = $.map( tagsElements, function( n ) { return n.textContent })

  return tags
}

document.addEventListener('turbolinks:load', ready)