From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: esp_scsi, was Re: Modified Linux 4.1.20 (mac+scsi) on Quadra
 660av
Date: Wed, 2 Nov 2016 20:53:50 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1611022052170.12008@nippy.intranet>
References: <579F54CA.7010009@yahoo.com> <alpine.LNX.2.00.1608021112170.25032@nippy.intranet> <57A0CACE.8060801@yahoo.com> <alpine.LNX.2.00.1608031413180.2246@nippy.intranet> <81b56e9c-21bf-09c1-6faa-2c79937b7557@gmail.com> <alpine.LNX.2.00.1610281447190.29347@nippy.intranet>
 <eab997b4-16be-2f63-1bc8-3d5030cc254e@gmail.com> <alpine.LNX.2.00.1610301649530.22486@nippy.intranet> <07619c3e-0786-cacf-9fcb-e32e5ed77a09@gmail.com> <alpine.LNX.2.00.1611011012510.23137@nippy.intranet> <1b5c4c4d-2524-6686-4c0c-0aa80016e9a1@gmail.com>
 <alpine.LNX.2.00.1611020905110.23787@nippy.intranet> <68fde294-4211-5984-a42d-8ded31b1a7c8@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:47844 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752073AbcKBJxq (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Nov 2016 05:53:46 -0400
In-Reply-To: <68fde294-4211-5984-a42d-8ded31b1a7c8@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, Tuomas Vainikka <tuomas.vainikka@aalto.fi>

Wed, 2 Nov 2016 20:53:50 +1100 (AEDT)
On Wed, 2 Nov 2016, Michael Schmitz wrote:

> 
> > The complication is that the spec demands that certain messages be 
> > acknowleged with /ATN negated before the final negation of /ACK. I 
> > think that negating /ACK with /ATN asserted signals message rejection.
> 
> Yep, that's my reading as well.
> 
> > 
> > Perhaps that's the problem here: scsi_esp_cmd(esp, ESP_CMD_SATN) 
> > occurs after the transfer,
> 
> Where? In esp_reconnect, we don't get to that point when returning from 
> esp_reconnect_with_tag() after timeout.

Well, the point is, we potentially release ACK (either after the 
Information Transfer command or after the Accept Message command) with ATN 
still asserted.

> And without timeout, there's still the check for ESP_CMD_FLAG_ABORT 
> which I don't see set anywhere.

I don't know what that's about. The git history may explain where it comes 
from.

> 
> > but instead probably should be scsi_esp_cmd(esp, ESP_CMD_RATN) before 
> > scsi_esp_cmd(esp, ESP_CMD_MOK). It would be easy to believe that some 
> > targets don't tolerate this.
> > 
> > Anyway, I suspect our problem lies in this reselection message 
> > transfer, not in the configuration registers.
> 
> How does the target signal end of message in phase? Stop handshaking, or 
> change phase?

Either would do. To stop handshaking would imply entering bus free phase.

> ATN going false?

AIUI, only the initiator can drive ATN.

> 
> With the DMA programmed for two tag bytes, and the reselection 
> originating from a tagged command, I would expect the target to send the 
> two tag bytes.

Sure, but I think the initator is messing it up along the way.

> Would it help to do the message transfer without DMA?

I would, just to see more clearly what was going on (command queue, 
control lines, bus phase).

Recall that Tuomas said he tried PIO for this with zorro_esp without any 
improvement. And I first saw this bug on a Quadra 660av, on which mac_esp 
uses PIO for all transfers.

> 
> > 
> >>
> >>> Anyway, there must about 3 potential patches from this discussion. I 
> >>> say we do as Geert suggests and move the discussion to the 
> >>> kernel.org lists (with code, of course).
> >>
> >> Agreed - the three patches I see so far would be
> >>
> >> - set config2 SCSI2 enable bit as originally proposed by Dave,
> >>
> >> - correct the esp_reset_cleanup() bug so a reset won't wipe out our 
> >>   config3 ESP_CONFIG3_TBMS and ESP_CONFIG3_GTM bits
> >>
> >> - set ESP_CONFIG3_TBMS and ESP_CONFIG3_GTM for all targets in either 
> >>   esp_slave_configure() or esp_reset_esp()
> >>
> >> Is that what you had in mind?
> > 
> > Something like that. All of which is based on the notion that the 
> > config2 SCSI2 Enable bit could be useful for an initiator. But that 
> > notion looks more and more dubious to me --
> > 
> > What use could an initiator have for the Group Two Command Block bit 
> > (ESP_CONFIG3_GTM)?
> 
> Upon closer reading of the docs, none.
> 
> > What use could an initiator have for the QTAG Control bit 
> > (ESP_CONFIG3_TBMS) when the target never controls /ATN? (I only 
> > remembered this yesterday, so please ignore my earlier comments about 
> > reselection and SEL-with-ATN.)
> 
> I had thought the reselection process similar to selection. But if the 
> target does not signal further message bytes by keepin ATN asserted, 
> that bit might not matter here.

If only the initator drives ATN, the documentation can only be referring 
to an ESP device in target mode.

> 
> Are we dealing with SCSI disks that fool the domain validation into 
> assuming tagged queuing capability, and then ignore the tag message 
> bytes, sending only the identify message byte on reselection?

I don't think so.

> 
> Trying to make reconnect_with_tag work for these disks would be foolish
> indeed ...

My recollection from 2009 is that this particular disk did work with 
mac_esp on one of my Quadras, but not on my 660av. And three people have 
reported the problem now (to my knowledge) so I don't blame the disks.

-- 

> 
> Cheers,
> 
> 	Michael
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
