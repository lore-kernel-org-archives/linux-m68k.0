From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: generalize uboot command line support
Date: Fri, 9 Sep 2016 09:33:00 +0200
Message-ID: <CAMuHMdUKLufiHyRuo3HhrXZ-fcDK5=qQ3mMsguKk2xBXtbrnjQ@mail.gmail.com>
References: <1473405228-928-1-git-send-email-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:34094 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751786AbcIIHdB (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Sep 2016 03:33:01 -0400
Received: by mail-oi0-f67.google.com with SMTP id a144so536521oii.1
        for <linux-m68k@vger.kernel.org>; Fri, 09 Sep 2016 00:33:01 -0700 (PDT)
In-Reply-To: <1473405228-928-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On Fri, Sep 9, 2016 at 9:13 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
> The uboot command line support needs to be used by both MMU and no-MMU
> setups, but currently we only have the code in the no-MMU code paths.
> Move the uboot command line processing code into its own file. Add
> appropriate calls to it from both the MMU and no-MMU arch setup code.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

If you want me to take this through the m68k tree instead, just let me know.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
