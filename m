From: Riccardo <riccardo@kaffe.org>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Wed, 5 Nov 2008 22:43:54 +0100
Message-ID: <D804E89A-AB82-11DD-9A74-00050249ADE1@kaffe.org>
References: <20081105022850.GA3243@cynthia.pants.nu>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out11.libero.it ([212.52.84.111]:52987 "EHLO
	cp-out11.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751954AbYKEVoM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Nov 2008 16:44:12 -0500
In-Reply-To: <20081105022850.GA3243@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Laurent Vivier <Laurent@lvivier.info>, geert@linux-m68k.org, linux-m68k@vger.kernel.org

Brad,

On Wednesday, November 5, 2008, at 03:28  AM, Brad Boyer wrote:

> On Wed, Nov 05, 2008 at 01:58:48AM +0100, Riccardo wrote:
>> Under Mac 7.1 it gets definitively recognized as Mac II. I 
>> definitively
>> have a SWIM, since one of my two floppies reads HD disks, I checked
>>
>> Penguin says my  gestalt is 6, Mac II
>>
>> A clue for the MacII is the 68020 CPU + FPU + MMU, AFAIK the only 
>> apple
>> machine with these specs.
>
> That definitely answers my question. Thank you.
>
true. But if the gestalt remains 6 even with a HD drive chip, how can 
you detect it?


- original IWM 800k drives
- SWIM with 800k drives or mixed drives
- SWIM with only 1.4k drives

I'm in the second situation, btw.

Riccardo

