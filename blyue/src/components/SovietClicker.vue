<script setup lang="ts">

import { ref } from 'vue';

const score = ref(0);

function incrementScore() {
    score.value++;
};

setInterval(() => {
    score.value++;
}, 1000);

</script>
<template>

    <div class="clicker">
        <h1>Soviet Clicker</h1>
        <p>Click the button to increase your score!</p>
        <button @click="incrementScore">Click me!</button>
        <p>Score: {{ score }}</p>
    </div>

</template>
<style scoped>

.clicker {
    color: var(--color-accent);
    background-color: var(--color-background);
    border-radius: 15px;
    padding: 20px;
    border: 5px solid var(--color-component-border);
}

</style>