# enchainer-main
Repo for launching first link of the chain. It is used to create a JSON like that:
```json
{
    "message" : "<the original message>",
    "chain": ["<IP vnf1>", "<IP vnf2>", ...]
}
```
And send it to the first element of the chain array
