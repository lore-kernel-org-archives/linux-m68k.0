From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] include: warn for inconsistent endian config definition
Date: Fri, 9 Jun 2017 16:11:18 +0200
Message-ID: <CAMuHMdV7eC95C=jZdWoAHC2tHT8duoNxWkhO6jWQbzouLDZS4A@mail.gmail.com>
References: <1496960243-196898-1-git-send-email-babu.moger@oracle.com>
 <1496960243-196898-3-git-send-email-babu.moger@oracle.com>
 <CAMuHMdX2u8vZGBVXitH+FcfeMwZ8a1-g2b-Dh7V9=HnqJpj=hw@mail.gmail.com>
 <CAMuHMdVia9Jkwz0eEbSG0OE-Sw5wMbdjA1o3F6m10NaSWXq_Vw@mail.gmail.com> <257e0d57-bf55-eb1b-26e2-ba50b1bd2676@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33975 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751535AbdFIOLU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Jun 2017 10:11:20 -0400
In-Reply-To: <257e0d57-bf55-eb1b-26e2-ba50b1bd2676@oracle.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Babu Moger <babu.moger@oracle.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, uclinux-h8-devel@lists.sourceforge.jp, Linux/m68k <linux-m68k@vger.kernel.org>, openrisc@lists.librecores.org, Parisc List <linux-parisc@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>

Hi Babu,

On Fri, Jun 9, 2017 at 3:55 PM, Babu Moger <babu.moger@oracle.com> wrote:
> On 6/9/2017 2:16 AM, Geert Uytterhoeven wrote:
>> On Fri, Jun 9, 2017 at 9:05 AM, Geert Uytterhoeven <geert@linux-m68k.org>
>> wrote:
>>>> Here is the original discussion
>>>> http://www.spinics.net/lists/devicetree/msg178101.html
>>>>
>>>> Signed-off-by: Babu Moger <babu.moger@oracle.com>
>>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>

> Yes. Got it.  So patch #1 is fine.   But, patch #2 might cause regressions.
> Should I drop patch 2.

No, it should be applied, and regressions should be fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
