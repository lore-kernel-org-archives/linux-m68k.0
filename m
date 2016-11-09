From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: esp_scsi, was Re: Modified Linux 4.1.20 (mac+scsi) on Quadra
 660av
Date: Wed, 9 Nov 2016 18:26:58 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1611091810190.16562@nippy.intranet>
References: <579F54CA.7010009@yahoo.com> <alpine.LNX.2.00.1608021112170.25032@nippy.intranet> <57A0CACE.8060801@yahoo.com> <alpine.LNX.2.00.1608031413180.2246@nippy.intranet> <81b56e9c-21bf-09c1-6faa-2c79937b7557@gmail.com> <alpine.LNX.2.00.1610281447190.29347@nippy.intranet>
 <eab997b4-16be-2f63-1bc8-3d5030cc254e@gmail.com> <alpine.LNX.2.00.1610301649530.22486@nippy.intranet> <07619c3e-0786-cacf-9fcb-e32e5ed77a09@gmail.com> <alpine.LNX.2.00.1611011012510.23137@nippy.intranet> <1b5c4c4d-2524-6686-4c0c-0aa80016e9a1@gmail.com>
 <alpine.LNX.2.00.1611020905110.23787@nippy.intranet> <68fde294-4211-5984-a42d-8ded31b1a7c8@gmail.com> <alpine.LNX.2.00.1611022052170.12008@nippy.intranet> <a72ead45-5b30-8ab8-aa2e-1b2404e7dc16@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54358 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751332AbcKIH0o (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Nov 2016 02:26:44 -0500
In-Reply-To: <a72ead45-5b30-8ab8-aa2e-1b2404e7dc16@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, Tuomas Vainikka <tuomas.vainikka@aalto.fi>


On Wed, 9 Nov 2016, Michael Schmitz wrote:
> 
> > Well, the point is, we potentially release ACK (either after the 
> > Information Transfer command or after the Accept Message command) with 
> > ATN still asserted.
> 
> Who asserts ATN in case of reselection? I always thought that the 
> target, by initiating reselection, assumes the role of initiator and is 
> in charge of driving bus phase changes (including control of ATN).
> 

The difference between selection and reselection is the SEL signal. For 
selection, the host controls SEL. For reselection, the device controls it.

If the device disconnects and reconnects a command, it doesn't alter the 
initiator/target roles for that command. The host always controls ATN.

> >> How does the target signal end of message in phase? Stop handshaking, 
> >> or change phase?
> > 
> > Either would do. To stop handshaking would imply entering bus free 
> > phase.
> > 
> >> ATN going false?
> > 
> > AIUI, only the initiator can drive ATN.
> 
> So the initiator would have to read two tag message bytes if a target 
> reselects that had a tagged command disconnected?

Right, the target contols the bus phase, so it will send as many bytes as 
it wants. The initiator gets to alter that behaviour by signalling with 
ATN. Hence esp_scsi needs to be more careful with ATN during reselection.

> From the initiator side, that should work (if an untagged commmand has 
> been issued, no tagged commands are sent so we expect either tagged or 
> untagged reselections).
> 
> >> With the DMA programmed for two tag bytes, and the reselection 
> >> originating from a tagged command, I would expect the target to send 
> >> the two tag bytes.
> > 
> > Sure, but I think the initator is messing it up along the way.
> 
> Can't see how - reconnect_with_tag() is only used if no untagged command 
> is on record for the target.

Please see prior discussion of "Queue Tag Enable" bit, which relates to 
target response to ACK with and without ATN. Please also refer to the 
first para quoted at the top of this message.

> 
> > 
> >> Would it help to do the message transfer without DMA?
> > 
> > I would, just to see more clearly what was going on (command queue, 
> > control lines, bus phase).
> 
> Not sure we can get control lines read - bus phases are available IIRC.
> 
> > Recall that Tuomas said he tried PIO for this with zorro_esp without 
> > any improvement. And I first saw this bug on a Quadra 660av, on which 
> > mac_esp uses PIO for all transfers.
> 
> PIO does get set up for the expected number of message bytes though. Is 
> there a check for phase mismatch during PIO?
> 

There is in mac_esp. But you really need to try it.

> > 
> > If only the initator drives ATN, the documentation can only be 
> > referring to an ESP device in target mode.
> 
> The documentation mentions a command descriptor block to be transferred
> - would only apply to ESP in target mode again.
> 
> > My recollection from 2009 is that this particular disk did work with 
> > mac_esp on one of my Quadras, but not on my 660av. And three people have 
> > reported the problem now (to my knowledge) so I don't blame the disks.
> 
> What ESP versions are used in the Quadras vs 660av?

All are ESP236 according to esp_scsi detection.

-- 

> 
> Cheers,
> 
> 	Michael
> 
> 
> 
