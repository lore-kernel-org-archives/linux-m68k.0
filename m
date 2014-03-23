From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 0/2] m68k/atari - make atafb work with kernel loaded to
 FastRAM
Date: Sun, 23 Mar 2014 13:28:54 +1300
Message-ID: <532E2AC6.9050500@biophys.uni-duesseldorf.de>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org> <1395478028-17274-1-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:45525 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750866AbaCWAap (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Mar 2014 20:30:45 -0400
Received: by mail-pa0-f53.google.com with SMTP id ld10so3882700pab.26
        for <linux-m68k@vger.kernel.org>; Sat, 22 Mar 2014 17:30:45 -0700 (PDT)
In-Reply-To: <1395478028-17274-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org

Michael Schmitz wrote:
> So far, I've only tested this on a patched version of ARAnyM, using Andreas'
> SkipSTRAM or LoadToFastRAM options. 
>   
Works just fine on my Falcon with CT60. Would be nice to have this 
tested on a stock Falcon, or TT.

Cheers,

    Michael
