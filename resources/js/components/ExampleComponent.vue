<template>
    <div class="container">
        <div class="row justify-content-center">
            <router-link to="/foo">Go to Foo</router-link>
            I'm an example component.
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
