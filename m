From: Luis Alves <ljalvs@gmail.com>
Subject: Re: [PATCH] Platform code merge for 68000 core cpus
Date: Tue, 23 Oct 2012 22:51:29 +0100
Message-ID: <CAGj5WxCr4RRaz0SxeYic6HvBTBYoayY8paX-0eiSRZKTM7gmsw@mail.gmail.com>
References: <1351017517-1881-1-git-send-email-ljalvs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:46718 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754721Ab2JWVv3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Oct 2012 17:51:29 -0400
Received: by mail-ie0-f174.google.com with SMTP id k13so6067154iea.19
        for <linux-m68k@vger.kernel.org>; Tue, 23 Oct 2012 14:51:29 -0700 (PDT)
In-Reply-To: <1351017517-1881-1-git-send-email-ljalvs@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org
Cc: gerg@snapgear.com, ljalvs@gmail.com

Hi Greg,

Please ignore this patch also. I've detected some errors in the head.S
file (due to the linker script changes - _bss is now _bss_stop ).

I'll fix those and build a kernel to fully test these changes.


Sorry for the incovenience,
Luis
