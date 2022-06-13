Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54F4C43334
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Jun 2022 18:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344356AbiFMSl4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Jun 2022 14:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344062AbiFMSlf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Jun 2022 14:41:35 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1A7DFF
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Jun 2022 08:22:43 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 43so4548149qvb.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Jun 2022 08:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qcugiPICJLPzQVbJaMNvRLiNwKZci/LNeFue+3qV07c=;
        b=I4vjbEwIvXjge/QOaCjRKPuby5+2brm93RZD9YzPSblXHGhuckQr1lc6RN2P2QIGs1
         sJBwYJz4MN35/kw5YgOwmCJQ0ogGaUR+vl3PTSmbxP53CeLQp3aji4OYsJNUof20NpEY
         /e2NiwTugywAK18+VVvh9tWjlsCQ/ez7WqLEZ6hRwT3NI5zeV2MPaxt6rlGicql12CuG
         QcDIddFaGiDeW8re7tCyq/IKuMDov9CALZKxYtgNgWm3Y9EF+OBugT1bNqfjthQU1Z6n
         QyrAyXM9P4lPu2OM0SxNbBX3dPIvvnLuV5CIBLeA3RQy3iVU5sti7ICUyrukEq0ru5oE
         RKjA==
X-Gm-Message-State: AJIora/dWnke/v57KZWGKg3tFl/j/Z0JLU7FQHDW1q3ArbOWunM6HrqX
        UHe8V+EFsSBpJcprgG478xbN9khQQcyS6Q==
X-Google-Smtp-Source: AGRyM1uOAzu0WtHm6GsP9NglTs8jWOb/Eb8fT2qtkdp1SFuE2xVwxUoduwICrdyMrQ8XlvmooyR9UQ==
X-Received: by 2002:ad4:5ec8:0:b0:464:5cc9:468b with SMTP id jm8-20020ad45ec8000000b004645cc9468bmr111578qvb.125.1655133762202;
        Mon, 13 Jun 2022 08:22:42 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id g16-20020a05620a40d000b006a791a42693sm3057222qko.133.2022.06.13.08.22.41
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 08:22:41 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id r3so10424515ybr.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Jun 2022 08:22:41 -0700 (PDT)
X-Received: by 2002:a25:d748:0:b0:65c:6b00:55af with SMTP id
 o69-20020a25d748000000b0065c6b0055afmr55080ybg.365.1655133761358; Mon, 13 Jun
 2022 08:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220610113427.908751-1-alexandr.lobakin@intel.com>
 <CAMuHMdUZCaPN2B6bvmja9rDm3qCc4mYYAOSEB2W0R0pws8peqw@mail.gmail.com> <20220613142645.1176423-1-alexandr.lobakin@intel.com>
In-Reply-To: <20220613142645.1176423-1-alexandr.lobakin@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jun 2022 17:22:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVayS6hV3CWW6FS-1cQKoGTCDxgVhZVPSyBMvJHBxVwJA@mail.gmail.com>
Message-ID: <CAMuHMdVayS6hV3CWW6FS-1cQKoGTCDxgVhZVPSyBMvJHBxVwJA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] bitops: let optimize out non-atomic bitops on
 compile-time constants
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Olek,

On Mon, Jun 13, 2022 at 4:28 PM Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, Jun 10, 2022 at 1:35 PM Alexander Lobakin
> > <alexandr.lobakin@intel.com> wrote:
> > On m68k, using gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04), this
> > blows up immediately with:
>
> Yeah I saw the kernel bot report already, sorry for that >_< Fixed
> in v3 already, will send in 1-2 days.

Is it simple to fix?
I might be able to give the fixed v2 a try before that.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
