<ul class="nav" role="tablist" id="nav-tab3">
    @foreach($categories as $category)
    <li>
        <a class="active"  wire:click="$emit('findProducts',{{$category->id}})">
            {{ $category->name }}
        </a>
    </li>
    @endforeach
</ul>
