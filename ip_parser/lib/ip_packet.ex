defmodule IpParser.IpPacket do
  defstruct [
    :protocol_version,
    :header_length_in_bytes,
    :type_of_service,
    :total_length_in_bytes,
    :source_ip_address,
    :destination_ip_address
  ]

  alias IpParser.IpPacket

  def from_bits(bits) do
    << protocol_version :: size(4), 
    header_length_in_words :: size(4),
    _type_of_service_legacy:: size(4),
    type_of_service_int :: size(4),
    total_length_in_bytes :: size(16),
    _unused :: size(64),
    source_ip_address :: size(32),
    destination_ip_address :: size(32),
    _rest :: bitstring >> = bits

    %IpPacket{
      protocol_version: protocol_version,
      header_length_in_bytes: header_length_in_words * (32 / 8),
      type_of_service: type_of_service_for(type_of_service_int),
      total_length_in_bytes: total_length_in_bytes,
      source_ip_address: source_ip_address,
      destination_ip_address: destination_ip_address
    }
  end

  def type_of_service_for(type_of_service_int) do
    case type_of_service_int do
      8 -> :minimize_delay
      4 -> :maximize_throughput
      2 -> :maximize_reliability
      1 -> :minimize_monetary_cost
      0 -> :unspecified
    end
  end
end
