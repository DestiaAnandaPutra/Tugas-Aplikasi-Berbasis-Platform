@extends('template')
@section('title', 'Daftar Produk')
@section('content')

<div class="container mt-5">

    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    <div class="d-flex justify-content-between mb-3">

        <span>{{ session('msg') }}</span>

        <a href="{{ route('product.create') }}"
           class="btn btn-primary">
            Tambah
        </a>

    </div>

    <table class="table table-bordered">

        <thead>
            <tr>
                <th>Nama</th>
                <th>Harga</th>
                <th>Variant</th>
                <th>Aksi</th>
            </tr>
        </thead>

        <tbody>

            @foreach($products as $product)

            <tr>

                <td>{{ $product->name }}</td>

                <td>
                    Rp {{ number_format($product->price,0,',','.') }}
                </td>

                <td>
                    <ul>
                        @foreach($product->variants as $var)

                            <li>{{ $var->name }}</li>

                        @endforeach
                    </ul>
                </td>

                <td>

                    <a href="{{ route('product.edit', $product->id) }}"
                       class="btn btn-warning btn-sm">
                        Edit
                    </a>

                    <form method="POST"
                          action="{{ route('product.destroy', $product->id) }}"
                          style="display:inline">

                        @csrf
                        @method('DELETE')

                        <button class="btn btn-danger btn-sm">Hapus
                        </button>

                    </form>

                </td>

            </tr>

            @endforeach

        </tbody>

    </table>

</div>

@endsection