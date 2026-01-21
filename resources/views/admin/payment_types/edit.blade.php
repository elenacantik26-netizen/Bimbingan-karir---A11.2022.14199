<x-layouts.admin>
    <h2 class="text-2xl font-bold mb-6">Edit Tipe Pembayaran</h2>
    <div class="bg-white p-6 rounded-lg shadow-md max-w-lg">
        <form action="{{ route('admin.payment-types.update', $paymentType->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2">Nama Tipe Pembayaran</label>
                <input type="text" name="name" value="{{ $paymentType->name }}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
            </div>
            <div class="flex items-center justify-between">
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                    Update
                </button>
                <a href="{{ route('admin.payment-types.index') }}" class="text-gray-600 hover:text-gray-800">Batal</a>
            </div>
        </form>
    </div>
</x-layouts.admin>