<script>
    let name;
    let title;
    let color;

    const hanldeSubmit = () => {
        console.log(name, title, color)
    }
</script>

<form on:submit|preventDefault={hanldeSubmit}>
    <input type="text" placeholder="name" bind:value={name} /><br/>
    <input type="text" placeholder="title" bind:value={title} /><br/>
    <input type="text" placeholder="color" bind:value={color} /><br/>
    <button>Add Nakama</button>
</form>

<style></style>