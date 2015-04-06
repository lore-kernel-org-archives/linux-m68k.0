From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Tue, 07 Apr 2015 09:25:41 +1200
Message-ID: <5522F9D5.3080107@gmail.com>
References: <21393.43065.207399.530921@gargle.gargle.HOWL> <mvm1tuv6dhk.fsf@hawking.suse.de> <21426.40682.197715.245775@gargle.gargle.HOWL> <CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com> <21786.40688.53001.509365@gargle.gargle.HOWL> <551B6143.4030805@gmail.com> <alpine.LNX.2.00.1504011533340.23336@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:34142 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751130AbbDFVZt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 6 Apr 2015 17:25:49 -0400
Received: by pdbni2 with SMTP id ni2so56471518pdb.1
        for <linux-m68k@vger.kernel.org>; Mon, 06 Apr 2015 14:25:48 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1504011533340.23336@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

> On Wed, 1 Apr 2015, Michael Schmitz wrote:
>
>   
>> I've followed the vm stats while running gunzip -c on a large file. I 
>> get an 'invalid compressed data' error at the very end of the gunzip 
>> run, and the file md5sum does not match what I get when uncompressing 
>> that file on another system with no error
>>     
>
> Was that an aranym virtual machine or a physical one? If physical, can the 
> error be reproduced using a virtual one (given same RAM size, kernel etc)?
>   

The gunzip error cannot be reproduced on any of my ARAnyM VMs. Might be 
a RAM error or other hardware related problem. Same kernel but 
configured slightly different (added 030 and 040 support, plus ARAnyM 
support).

The general behaviour (gunzip eats up all free RAM, then kswapd spins 
doing nothing very apparent, with no dirty pages to be flushed and 
cached pages never released) remains the same. Though I've seen the 
gunzip complete without kicking off kswapd on occasion (had set 
dirty_background_ratio and dirty_ratio half the default for that).

And yes, dropping cached pages as Andreas suggested, does free up 
significant (i.e. most of all) RAM and shuts up kswapd.

    Michael
