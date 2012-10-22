From: Ezequiel Garcia <elezegarcia@gmail.com>
Subject: Event tracing support on m68k
Date: Mon, 22 Oct 2012 11:22:32 -0300
Message-ID: <CALF0-+W9ZZNW-ciRyk64WqsSwXVXHjVaFRC563XHN1--S+=Zgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:54289 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750927Ab2JVOWc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 22 Oct 2012 10:22:32 -0400
Received: by mail-ie0-f174.google.com with SMTP id k13so3632516iea.19
        for <linux-m68k@vger.kernel.org>; Mon, 22 Oct 2012 07:22:32 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Steven Rostedt <rostedt@goodmis.org>, Tim Bird <tim.bird@am.sony.com>, linux-m68k@vger.kernel.org, uClinux development list <uclinux-dev@uclinux.org>

Hi,

While trying to trace an m68k (without MMU) platform, I discovered
there's no "TRACING"
option on m68k menuconfig.

* Am I doing anything wrong? Is there no tracing support on m68k?

Now, I understand that function trace needs some kind of hardware support.
However, since trace events (like kmem events) look like some software trick,
I expected to get those architecture-wide.

* So, trace events also need hardware support? They aren't software-only stuff?

Any clarification will be most welcome!
Thanks!

    Ezequiel
