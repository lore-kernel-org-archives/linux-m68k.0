From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 0/2] m68k/atari - make atafb work with kernel loaded to FastRAM
Date: Sat, 22 Mar 2014 21:47:06 +1300
Message-ID: <1395478028-17274-1-git-send-email-schmitz@debian.org>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:41808 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738AbaCVIrW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Mar 2014 04:47:22 -0400
Received: by mail-pd0-f181.google.com with SMTP id p10so3293749pdj.12
        for <linux-m68k@vger.kernel.org>; Sat, 22 Mar 2014 01:47:22 -0700 (PDT)
In-Reply-To: <1395213784-3249-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org

Geert,

cleaned up version of my earlier patches to make allocation of ST-RAM work
even when the kernel resides in FastRAM, and ST-RAM is not normally usable
by Linux because it violates the memory chunk order required for the 
discontig memory model.

The code relies on a mapping that has been set up for the first 16 MB of
address space in head.S - this may  not be ideal, because the mapping is
set up as non-cacheable and serialized (for reasons of hardware registers
mapped in the upper end of that segment). 

I've taken care not to disturb the cache mode for the framebuffer if the
framebuffer resides in the first 4 MB of ST-RAM, for now. This is easily
disabled by reverting the relevant piece of code back to its old state
(preserving the changes to the virt/phys translation).

So far, I've only tested this on a patched version of ARAnyM, using Andreas'
SkipSTRAM or LoadToFastRAM options. 

Code path for external framebuffer has not been changed - this code relies on
the user passing the address of an external VGA framebuffer to the kernel, 
and should continue to work as normal. 

The use of special ST-RAM virt/phys translation helpers somewhat complicates
the addition of code to deal with Videl-compatible hardware that uses a
dedicated video RAM chunk distinct from ST-RAM. Not sure how to work around
that. 

Cheers,

	Michael
 
