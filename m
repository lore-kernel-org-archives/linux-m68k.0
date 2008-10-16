From: Joshua Juran <jjuran@gmail.com>
Subject: Re: I'm back on linux-m68k
Date: Thu, 16 Oct 2008 02:44:49 -0700
Message-ID: <6B9C18AB-8435-419A-9C58-84A57760B4FE@gmail.com>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com> <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au> <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.230]:21123 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752723AbYJPJoy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 16 Oct 2008 05:44:54 -0400
Received: by rv-out-0506.google.com with SMTP id k40so3365157rvb.1
        for <linux-m68k@vger.kernel.org>; Thu, 16 Oct 2008 02:44:54 -0700 (PDT)
In-Reply-To: <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

On Oct 15, 2008, at 4:05 PM, Laurent Vivier wrote:

> It's a good idea but the primary goal of EMILE is to totally remove  
> MacOS from the disk...
>
> Now, as we are able to boot linux directly from a CD the tools can  
> stay on linux side.

That's certainly nice to have as an option, but so are MacOS-hosted  
tools.

> So perhaps Joshua can help me to write some parts, in my TODO there  
> are:
>
> - save/change/restore the gamma of the screen (I don't like the  
> green display of my Q610)
> - save/change/restore the video mode
> - save/change/restore the boot device

Based on the information at <http://okmij.org/ftp/xPRAM.html> (some  
of which is wrong) and some experimentation, I'm able to read the  
extended PRAM, and I've added a read-only /sys/mac/xpram file to Lamp  
(Lamp ain't Mac POSIX), my Unix-like environment for classic Mac OS  
(like MPW, only much better).  In other words, I have working sample  
code for reading the xPRAM (and writing it is almost identical).

Josh


