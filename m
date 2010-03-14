From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: atomic_sub_and_test() asm constraints
Date: Sun, 14 Mar 2010 13:59:06 +0100
Message-ID: <10f740e81003140559y7692c30ena811b6c0283c2303@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:52666 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756861Ab0CNM7I (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Mar 2010 08:59:08 -0400
Received: by wwb34 with SMTP id 34so150422wwb.19
        for <linux-m68k@vger.kernel.org>; Sun, 14 Mar 2010 05:59:06 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

|   CC      mm/memcontrol.o
| {standard input}: Assembler messages:
| {standard input}:4076: Error: operands mismatch -- statement `subl
12(%fp),170(%a0)' ignored

Seems like we have bad asm constraints in

static inline int atomic_sub_and_test(int i, atomic_t *v)
{
        char c;
        __asm__ __volatile__("subl %2,%1; seq %0" : "=d" (c), "+m"
(*v): "g" (i));
        return c != 0;
}

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
