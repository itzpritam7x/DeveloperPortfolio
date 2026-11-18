# API Summary

A REST API lets software request or update resources through standard HTTP methods and URLs. It often returns JSON that other programs can parse.

- **200** means the request succeeded.
- **404** means the requested resource was not found.

The jq filter `{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}` creates an object containing the four named values from a GitHub user response.

Fetch fresh responses from WSL:

```bash
curl -fsS https://api.github.com/users/itzpritam7x -o API/github_profile.json
jq '{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}' API/github_profile.json
curl -fsS https://jsonplaceholder.typicode.com/posts -o API/sample_posts.json
jq length API/sample_posts.json
```

Previous CSE103 lab output showed 3 public repositories and 0 followers at that time; refresh the JSON because counts can change.
