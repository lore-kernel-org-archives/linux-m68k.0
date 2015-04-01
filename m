From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Wed, 01 Apr 2015 18:21:07 +1300
Message-ID: <551B8043.2040206@gmail.com>
References: <21393.43065.207399.530921@gargle.gargle.HOWL> <mvm1tuv6dhk.fsf@hawking.suse.de> <21426.40682.197715.245775@gargle.gargle.HOWL> <CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com> <21786.40688.53001.509365@gargle.gargle.HOWL> <551B6143.4030805@gmail.com> <alpine.LNX.2.00.1504011533340.23336@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:34634 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751259AbbDAFVI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 1 Apr 2015 01:21:08 -0400
Received: by pdbni2 with SMTP id ni2so43476528pdb.1
        for <linux-m68k@vger.kernel.org>; Tue, 31 Mar 2015 22:21:07 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1504011533340.23336@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

>> I've followed the vm stats while running gunzip -c on a large file. I 
>> get an 'invalid compressed data' error at the very end of the gunzip 
>> run, and the file md5sum does not match what I get when uncompressing 
>> that file on another system with no error
>>     
>
> Was that an aranym virtual machine or a physical one? If physical, can the 
> error be reproduced using a virtual one (given same RAM size, kernel etc)?
>
>   

Physical - and I haven't tried to reproduce on a VM yet. Cloning the 
system for a VM won't be trivial but I can give it a shot.

    Michael
