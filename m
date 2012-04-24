From: Luis Alves <ljalvs@gmail.com>
Subject: __udivsi3: coldfire vs non-coldfire implementation
Date: Tue, 24 Apr 2012 15:14:17 +0100
Message-ID: <CAGj5WxCrOC-SKUjrv=3RTTjx7F5n4+vLhH_7HRS1crVSnf6RuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:61660 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754480Ab2DXOOS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 24 Apr 2012 10:14:18 -0400
Received: by lbbgf7 with SMTP id gf7so645083lbb.19
        for <linux-m68k@vger.kernel.org>; Tue, 24 Apr 2012 07:14:17 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi all,

What's the reason for having two different algorithms for this function?
The coldfire version seems faster since it doesn't perform any div/mul
opcodes. Or am I wrong?

(arch/m68k/lib/udivsi3.S)

Regards,
Luis Alves
