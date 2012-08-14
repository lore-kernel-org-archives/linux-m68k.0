From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: select CONFIG_GENERIC_ATOMIC64 for all m68k CPU types
Date: Tue, 14 Aug 2012 09:52:30 +0200
Message-ID: <CAMuHMdWTVUEAg=SFj-z6Mm7u0v3aWQ1KFsCo-yHaW+F=c3Gjrw@mail.gmail.com>
References: <1344919533-9357-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:42545 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754803Ab2HNHwb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 Aug 2012 03:52:31 -0400
In-Reply-To: <1344919533-9357-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, fengguang.wu@intel.com, ebiederm@xmission.com, Greg Ungerer <gerg@uclinux.org>

On Tue, Aug 14, 2012 at 6:45 AM,  <gerg@snapgear.com> wrote:
> There is no specific atomic64 support code for any m68k CPUs, so we should
> select CONFIG_GENERIC_ATOMC64 for all. Remove the existing per CPU selection
> of this and select it for all m68k.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
