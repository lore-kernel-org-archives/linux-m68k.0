From: Matthew Lear <matt@bubblegen.co.uk>
Subject: 2.6.29 & network stack strangeness
Date: Fri, 05 Jun 2009 16:15:59 +0100
Message-ID: <4A2936AF.4080601@bubblegen.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from relay.ptn-ipout02.plus.net ([212.159.7.36]:31018 "EHLO
	relay.ptn-ipout02.plus.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751889AbZFEPQC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 5 Jun 2009 11:16:02 -0400
Received: from [80.229.236.194] (helo=[192.136.1.12])
	 by pih-relay08.plus.net with esmtp (Exim) id 1MCb9E-0003ed-Os
	for linux-m68k@vger.kernel.org; Fri, 05 Jun 2009 16:16:01 +0100
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hello all,

I'm running a 2.6.29 kernel on an MMU enabled m68k coldfire mcf54455 platform
and I'm having some throughput problems when running network tests.

The kernel boots and mounts its rootfs from flash (jffs2). udhcpc runs, obtains
a lease from the dhcp server and configures eth0. Network connectivity is ok. I
can ping the target from the host and vice versa.

1/
If I run ping -s 1500 -i 0.0001 <target ip address> on the host pc, after
several mins, the kernel reports 'unexpected interrupt from 24' which is the
vector for a spurious interrupt. This message will repeat randomly (from what I
saw it appeared ~ 20 times when running the ping test above for 40 mins). The
mcf54455 reference manual describes a possible cause for spurious interrupts.
However, this test very rarely reports any packet loss, although the max time to
receive a packet can be very large indeed.

2/
If I reboot, start again and run a ping flood test (ping -f) from host pc ->
target, all icmp requests are acknowledged - for a while. Before the target
begins to fail to respond to the icmp requests, running top shows that the
ksoftirq daemon is running at ~ 5% cpu load. This is normal as it is involved in
processing the deferred tasks of processing data fired up to the network stack.
So when the target beings to stop responding to icmp, if I then stop the ping
flood and try to ping the host from the target, there is no reply indicated by
ping. However, if you do this with a packet sniffer running (eg wireshark) you
can see that data is still being transmitted from the target -> host and you can
see the icmp reply, only the reply from the host appears to be received ok by
the fec driver but is processed by the network stack target.

When in this state, a proc entry that I added to the fec driver shows that the
last return value from netif_rx() (called in the fec rx interrupt handling
routine) is 1, indicating that the last packet was dropped by the network stack,
e.g.

~ # cat /proc/driver/fec
total interrupts: 1421619
last interrupt type: 2 [1=tx, 2=rx, 3=mii]
total tx interrupts: 709148
total rx interrupts: 712472
total mii interrupts: 1
last interrupt event: 0x2000000
total eberr interrupts: 0
total hberr interrupts: 0
tx loop current count: 0
tx loop last count: 1
rx loop current count: 0
rx loop last count: 1
rx last cbd ctrl/status: 0x800
rx last cbd len: 346
rx last cbd buff addr: 0x40410000
rx last netif_rx status: 1

Strangely, wireshark still shows data being transmitted from the target
-> host. I can see ARP requests and I can also see DHCP discovery packets being
sent by the target when its DHCP lease expires. This all looks ok, only the
reply from host -> target is never processed by the target as the network stack
is in a state where it is dropping all incoming data provided to it by the driver.

I believe udhcpc utilises the network device directly, ie it does not require an
intermediate network protocol being implemented in the kernel (tcpdump is
similar).

The fec driver still seems to be running ok because I can see the ring buffer
address changing when data is received. Everything seems to be ok apart from the
network stack. Very strange indeed.

Running network throughput tests between host and target with netcat or netperf
only run for a few seconds before activity ceases.

Has anybody experienced anything similar? Why does the network stack appear to
be stuck and constantly dropping packets?

Any feedback appreciated.

Rgds,
--  Matt
