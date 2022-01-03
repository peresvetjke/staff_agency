function ready() {
  var skillsList = $("ul#skills")[0]

  if (skillsList) {
    var skillInput = $("#skill")[0]
    var addSkillButton = $("#add_skill")[0]
    var submitButton = $("input[type='submit']")[0]
    var resultsList = $("#search_results")[0]
    var request = new XMLHttpRequest();

    // add new tag
    addSkillButton.addEventListener("click", (e) => {
      e.preventDefault()

      addNewTag(skillInput.value, skillInput, skillsList, resultsList)
    })

    // seek for tags
    skillInput.addEventListener("input", (e) => { 
      $(resultsList).empty()
      var url = "/skills/search?name=" + e.target.value
      request.open('GET', url)
      request.send()
    })

    // display results
    request.addEventListener("readystatechange", () => { 
      if (request.readyState === 4 && request.status === 200) { 
        var results = JSON.parse(request.responseText)
        for (i = 0; i < results.length; i++) {
          if (tagsArray(skillsList).indexOf(results[i].name) == -1) {
            var newTag = document.createElement("li");
            newTag.appendChild(document.createTextNode(results[i].name));
            resultsList.appendChild(newTag)
          }
        }
      }
    })

    $(resultsList).on("click", "li", (e) => {
      addNewTag(e.target.textContent, skillInput, skillsList, resultsList)
    })

    // remove tag
    $(skillsList).on("click", "li", (e) => {
      $(e.target).remove()
    })

    // insert skill_list before submit
    submitButton.addEventListener("click", (e) => {
      addHiddenField(skillsList)
    })
  }
}

function addNewTag(value, skillInput, skillsList, resultsList) {
  if (value == "") { alert("Can't be blank!") } 
  else if ( tagsArray(skillsList).indexOf(value) >= 0 ) { alert(`Already in the list (${value})!`) } 
    else {
      // append new tag
      var newTag = document.createElement("li");
      newTag.appendChild(document.createTextNode(value));
      skillsList.appendChild(newTag)
    
      // clear input and results
      skillInput.value = ''
      $(resultsList).empty()
    }
}

function addHiddenField(list) {
  const hiddenField = document.createElement('input')
  hiddenField.setAttribute("type", "hidden");
  hiddenField.setAttribute("value", tagsArray(list));
  hiddenField.name = `${list.dataset.klass}[skill_list]`
  list.appendChild(hiddenField)
}

function tagsArray(list) {
  var tagsElements = $(list).children().toArray()
  var tags = $.map( tagsElements, function( n ) { return n.textContent })

  return tags
}

document.addEventListener('turbolinks:load', ready)