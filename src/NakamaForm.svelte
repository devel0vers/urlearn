<script>
    import { createEventDispatcher } from "svelte";

    let dispatch = createEventDispatcher();

    let name;
    let title;
    let haki = [];
    let color;

    const hanldeSubmit = () => {
        const nakama = {
            name,
            title,
            haki,
            color,
            id: Math.random(),
        }

        dispatch('addNakama', nakama)
    }
</script>

<form on:submit|preventDefault={hanldeSubmit}>
    <input type="text" placeholder="name" bind:value={name} /><br/>
    <input type="text" placeholder="title" bind:value={title} /><br/><br/>
    <label>Haki :</label>
    <!-- <input type="checkbox" bind:checked={var} value="testing">testing<br/> -->
    <input type="checkbox" bind:group={haki} value="busoshoku">Busoshoku<br/>
    <input type="checkbox" bind:group={haki} value="kenbunshoku">Kenbunshoku<br/>
    <input type="checkbox" bind:group={haki} value="haoshoku">Haoshoku<br/><br/>
    <label>Color :</label>
    <select bind:value={color}>
        <option value="red">Red</option>
        <option value="green">Green</option>
        <option value="black">Black</option>
        <option value="blue">Blue</option>
    </select><br/><br/>
    <button>Add Nakama</button>
</form>

<style></style>