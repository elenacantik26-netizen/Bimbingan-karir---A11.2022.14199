<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoreOrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     */
    public function rules(): array
    {
        return [
            'event_id' => 'required|exists:events,id',
            'payment_type_id' => 'required|exists:payment_types,id',
            'tickets' => 'required|array|min:1',
            'tickets.*.id' => 'required|exists:tikets,id',
            'tickets.*.quantity' => 'required|integer|min:1',
            'tickets.*' => 'required|array',
        ];
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'payment_type_id.required' => 'Silakan pilih metode pembayaran',
            'payment_type_id.exists' => 'Metode pembayaran tidak valid',
            'tickets.required' => 'Silakan pilih tiket',
            'tickets.min' => 'Minimal pilih 1 tiket',
            'tickets.*.id.required' => 'ID tiket tidak boleh kosong',
            'tickets.*.id.exists' => 'Tiket tidak ditemukan',
            'tickets.*.quantity.required' => 'Jumlah tiket harus diisi',
            'tickets.*.quantity.integer' => 'Jumlah tiket harus angka bulat',
            'tickets.*.quantity.min' => 'Jumlah tiket minimal 1',
        ];
    }

    /**
     * Handle a failed validation attempt.
     */
    protected function failedValidation(Validator $validator)
    {
        if ($this->expectsJson()) {
            throw new HttpResponseException(response()->json([
                'success' => false,
                'message' => 'Validasi gagal',
                'errors' => $validator->errors()
            ], 422));
        }

        parent::failedValidation($validator);
    }
}
