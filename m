From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: debian installation
Date: Tue, 29 Sep 2009 00:26:50 +1000 (EST)
Message-ID: <alpine.OSX.2.00.0909290020580.412@silk.local>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>  <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>  <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com>  <20090901151747.GB27514@marenka.net>
 <alpine.OSX.2.00.0909050045330.383@silk.local>  <4AA2684E.1080009@codesourcery.com>  <alpine.LNX.2.00.0909122039160.6219@nippy.intranet>  <4AAC7CB6.2060400@codesourcery.com>  <alpine.LNX.2.00.0909141827440.25347@nippy.intranet>
 <8259f0250909212211l6f4dd00aue3a648f1166ba582@mail.gmail.com> <8259f0250909280700p7c28e82cye8b507d42427df25@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:34567 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752218AbZI1O0m (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Sep 2009 10:26:42 -0400
In-Reply-To: <8259f0250909280700p7c28e82cye8b507d42427df25@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: mike <localgost@gmail.com>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org



On Mon, 28 Sep 2009, mike wrote:

> Ok, i've nearly finished my manual install of 3.1r8...
> I've got two problems, im missing
> /lib/modules/2.4.27-amiga/modules.dep ( does anyone have it handy? )

It is generated using the "depmod -ae" command (I think those are the 
correct arguments...) Normally it is generated at boot time, but I guess 
it is not run if you stop at the single user run level.

> 
> And a "passwd: Authentication token manipulation error"

Sounds familiar but I don't recall what the cause was. Maybe google it.

Finn

> I've checked the perms of /etc/shadow they are shadow root and correct
> rw. so is passwd
> 
> And i can so far only boot into single user mode. But that will work for now.
> 
> -Mike
