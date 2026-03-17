async function carregarPosts(){

    const res = await fetch('/api/posts')
    const posts = await res.json()
    
    let html = ""
    
    posts.forEach(p => {
    html += `
    <h2>${p.title}</h2>
    <p>${p.content}</p>
    <hr>
    `
    })
    
    document.getElementById("posts").innerHTML = html
    
    }
    
    carregarPosts()