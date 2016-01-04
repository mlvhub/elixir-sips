defmodule IpParserTest do
  use ExUnit.Case
  doctest IpParser

  alias IpParser.IpPacket

  setup do
    bits = File.read!("./sample_packet.bits")

    packet = IpPacket.from_bits(bits)
    {:ok, packet: packet}
  end

  test "getting protocol version", meta do
    assert meta[:packet].protocol_version == 4
  end

  test "getting header length in bytes", meta do
    assert meta[:packet].header_length_in_bytes == 20
  end

  test "getting type of service", meta do
    assert meta[:packet].type_of_service == :unspecified
  end

  test "getting total length in bytes", meta do
    assert meta[:packet].total_length_in_bytes == 44
  end
end
