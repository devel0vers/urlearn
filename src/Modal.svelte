<script>
export let message = "It's default message"
export let isPromo = false;
export let showModal = false;
</script>

{#if showModal}
<div class="backdrop" on:click>
    <div class="modal" class:promo={isPromo}>
        <p>{message}</p>
    </div>
</div>
{/if}

<style>
    .backdrop{
        width: 100%;
        height: 100%;
        position: fixed;
        background: rgba(0,0,0,0.8)
    }

    .modal{
        padding: 10px;
        border-radius: 10px;
        max-width: 400px;
        margin: 10% auto;
        text-align: center;
        background: white;
    }

    .promo{
        background: crimson;
        color: white;
    }
</style>