<script>
	// Event Modifier
	// once - makes sure the event can only fire once (remove handler)
	// preventDefault - prevent the default action (run e.preventDefault)
	// self - only fires the event if the clicked element is the target

	import Modal from './Modal.svelte';
	import NakamaForm from './NakamaForm.svelte'

	let firstName = 'Faizin';
	let lastName = 'Kholiq';
	let color = 'black';
	let mugiwara = [
		{ name: 'Luffy', color: 'red', title: 'captain', haki: [], id: 1 },
		{ name: 'Zoro', color: 'green', title: 'swordsman', haki: [], id: 2 },
		{ name: 'Sanji', color: 'black', title: 'chef', haki: [], id: 3 },
	];
	let showModal = false;

	$: fullName	= `${firstName} ${lastName}`;

	const handleClick = () => {
		if(color != 'orange'){
			color = 'orange';
		}else{
			color = 'black'
		}
	}

	const handleInput = (e) => {
		color = e.target.value;
	}

	const deleteNakama = (id) => {
		mugiwara = mugiwara.filter((nakama) => nakama.id != id);
	}

	const toggleModal = () => {
		showModal = !showModal;
	}

	const addNakama = (e) => {
		const nakama = e.detail
		mugiwara = [nakama, ...mugiwara]
		showModal = false
	}
</script>

<Modal message="Hi, I am a modal" isPromo={false} {showModal} on:click={toggleModal}>
	<div slot="title">Add a new nakama</div>
	<NakamaForm on:addNakama={addNakama} />
</Modal>
<main>
	<button on:click={toggleModal}>Open Modal</button>
	<p style="color:{color}; font-weight:bold">{fullName} - {color}</p>
	<!-- <button on:click={handleClick}>Change color</button> -->
	<input type="text" bind:value={firstName}/>
	<input type="text" bind:value={lastName}/>
	<input type="text" bind:value={color}/>

	{#each mugiwara as nakama}
		<div>
			<h4 style="color:{nakama.color}">{nakama.name}</h4>
			{#if nakama.color === 'red'}
				<strong>PIRATES KING</strong>
			{/if}
			<p>Title: {nakama.title}</p>
			<button on:click = {() => deleteNakama(nakama.id)}> delete</button>
		</div>
	{:else} 
		<p>No nakama joined</p>
	{/each}
</main>
<style>
	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
	}

	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 4em;
		font-weight: 100;
	}

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>