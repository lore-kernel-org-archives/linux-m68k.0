Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A03C2BA4C
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Jan 2022 14:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235464AbiAZOPm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Jan 2022 09:15:42 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:35969 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235423AbiAZOPm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Jan 2022 09:15:42 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M9WeC-1n9PAW1HvA-005bDs for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jan
 2022 15:15:40 +0100
Received: by mail-wr1-f43.google.com with SMTP id e8so24233524wrc.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jan 2022 06:15:40 -0800 (PST)
X-Gm-Message-State: AOAM5324Jn+zrZTyT0HTk6qDReRlF9cyEVnP3D6WL3fUdyT9OzSuQTqG
        +NUkVeRQVNycExX6b8vtxYKZMgQAHeAvY9ryACE=
X-Google-Smtp-Source: ABdhPJypUHBTeRx/2wQs8W86Fm5/h6oi7YvMer36TrIuhT81FZ7IHgq/MbBkCknxuUWDS+dxyf0rqtN/tkqX9OjSS6E=
X-Received: by 2002:adf:fd05:: with SMTP id e5mr22581036wrr.192.1643206539963;
 Wed, 26 Jan 2022 06:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20220121200738.2577697-1-laurent@vivier.eu> <20220121200738.2577697-3-laurent@vivier.eu>
 <YfFPjOEELiTWr2uj@kroah.com>
In-Reply-To: <YfFPjOEELiTWr2uj@kroah.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 26 Jan 2022 15:15:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a32PRo4OJmUPmgnhp_14biz4bfs5BnDXej1itwOfkuvKA@mail.gmail.com>
Message-ID: <CAK8P3a32PRo4OJmUPmgnhp_14biz4bfs5BnDXej1itwOfkuvKA@mail.gmail.com>
Subject: Re: [PATCH v12 2/5] tty: goldfish: introduce gf_ioread32()/gf_iowrite32()
To:     Greg KH <greg@kroah.com>
Cc:     Laurent Vivier <laurent@vivier.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nhXP2dhhmzN/JfH1NNIAvrPdBxt4rA2NQ/tAM3tNv+H2Z0l0kQk
 KuTlPMr6UGXhsZGHqun8YXw75guEO+fCeVFRaH7dlOKZggF4hTHz0QXjl8ZTe+h7ZXF4ixG
 hVlOZuYXF7AZSY94Sgd4g5QKBERSlp6M9ioFWWx/nHItmNaqn70tK0+DuH4kQem+Nj9IZDh
 5wbV6NoVsmxbegydQIhzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rtfcJUctX1k=:trT2Gi+yDcY+/aHnLHZF/r
 m7b9ZYnZF/bKqG6HfV23iyKU3RmyuTBL+Qbi9luB3Cky0FzvDJzocdthxVAlruc9wyPv0UPx5
 3X+L9CNEvIQkxDODZaWEpE5iWx9PHVR2SWhuElqGOAfo+2fxXazzJqxcOSC9tY1SkvvLhI0TS
 BuiwPZLIfaUlebpVvhdRWelGFmEOs/vsg5oB+E7q6CMWnRjCLwr6adMOrsPc1Yxj2XPr2Ok3G
 Prddz8zrKbnYUHy3VQ1k8lySjoUwpZOQeHttOu/tAZJCyKZhZgNCntshFqiYb5UKtQ8FVPzlp
 m0rTKCiUtTMnAfMdqmYzwsqxbcwlKq5RjpUgPhScdj+bhKB7iiV0nT2E8VD1mlxIqDBUNg0f+
 d59mfvCzW2ndoQttcXGQHYMPp+WqzzNJZ0yqp+JJsgfjMShtFLqZMnGyEUW2OPm0H+LPujWzB
 6pBoSDhvCn/M4TU5oQCYXjiRC8b2ULD+2SlAfSVloz7YqBARQ9G87C9TLXFmwUy8ZdGQY8VqV
 2fsmUEm68HGE0itdsDF8y6hv+u1d7O5bBK3MVKt8MNCR/fyPTx6icyOLQWJJMstpQh8Y1h7sZ
 e+wVjtrgr9J/RGuvuyy/9YHUve9fEY3YhqfmgQBpyxc0lHR5SBkowmZYk4EyEZjUrdL+w9UfS
 SSKfVixmci7SNYlDxkB96OeIsvTBh+aDKmGw0OBBH9YsfPygYvjEIO57tfYPZB73XH+o=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jan 26, 2022 at 2:41 PM Greg KH <greg@kroah.com> wrote:
>
> On Fri, Jan 21, 2022 at 09:07:35PM +0100, Laurent Vivier wrote:
> > Revert
> > commit da31de35cd2f ("tty: goldfish: use __raw_writel()/__raw_readl()")
>
> Why?
>
> > and define gf_ioread32()/gf_iowrite32() to be able to use accessors
> > defined by the architecture.
>
> What does this do?

The reverted commit was an incorrect workaround for an old qemu bug:

The goldfish devices are apparently defined as "native" endianness,
which in qemu is whatever the architecture maintainers thought it should
be at the time (little-endian on arm, big-endian on powerpc, board
specific on mips, etc.) but independent of what kernel is actually running
on the machine if the CPU supports both.

m68k in qemu picked big-endian here, which is the opposite of what
the kernel driver does, presumably because that is the endianness of
the CPU itself.

Since we can't fix qemu any more, and runtime detection doesn't work
on machines without devicetree, having a sane default (whatever the
driver used to do) and an architecture specific override for those that
got it wrong is probably our best option.

       Arnd
