Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CBDE92FF4
	for <linux-m68k@archiver.kernel.org>; Fri,  6 Oct 2023 07:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbjJFHsA convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 6 Oct 2023 03:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjJFHr7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 6 Oct 2023 03:47:59 -0400
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37499E4
        for <linux-m68k@lists.linux-m68k.org>; Fri,  6 Oct 2023 00:47:57 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d86a0c97ae6so2083670276.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 06 Oct 2023 00:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696578476; x=1697183276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whdXtnn3QtkC3PF+D7tDSfsaYGhc6T0GVp0WP9AJMwY=;
        b=Eww5w4sQUAu23MYjWC2ud0rwc2E/PK5NCWIklydF7WA2Whi0w0YkjwLqEPVW5ZHllF
         GSYXztX8xacV7feZU0J15aRf1lxSDFgoEELpmAd8xU5gwlxuyEO3zT/DsgDHoyL1zpXN
         E8enD0Y2YWUxNf9GsaxykFZ1otYKrHxkTRR4/xiReQppH/ousw1T5Vq2kKrPB3/O4FVk
         vtcd60TOOchGVg1SVri+22nys22+QLVr5VdWNsdS6c0q+kgvoIWMZXDHHbRyZgE4TDiS
         iVyUivCAL27HAAe6uTwf/T/PlFcOWLFVZELRHhSnIXyEY2Hp/veDM9/jYSnxnRkT9Tc2
         ZBhA==
X-Gm-Message-State: AOJu0Yx9yeniWptaurruHKoyh5ek+Lvytx9m5DXXSRmrMFYLlu/Bk9bx
        aCzjjqQcrmiVWZFmr6eplXCOw6ES0uhUlA==
X-Google-Smtp-Source: AGHT+IGXP+wm3iGXKWh0zr1aWg8Einq05ibw66Tru6ewtRepONJgq9pV6Uf72UcA7fhv4J79ZykvDQ==
X-Received: by 2002:a25:24cd:0:b0:d81:cdda:729c with SMTP id k196-20020a2524cd000000b00d81cdda729cmr7064181ybk.23.1696578475911;
        Fri, 06 Oct 2023 00:47:55 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id d67-20020a25cd46000000b00d7e96c6eaf5sm920457ybf.46.2023.10.06.00.47.55
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 00:47:55 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59f57ad6126so21144647b3.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 06 Oct 2023 00:47:55 -0700 (PDT)
X-Received: by 2002:a81:65d6:0:b0:59b:dbb7:5c74 with SMTP id
 z205-20020a8165d6000000b0059bdbb75c74mr7330128ywb.32.1696578475344; Fri, 06
 Oct 2023 00:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <794c5d543dbdae8336a13ef2459adafaaadb7d86.1695031620.git.geert@linux-m68k.org>
In-Reply-To: <794c5d543dbdae8336a13ef2459adafaaadb7d86.1695031620.git.geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Oct 2023 09:47:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9-j307t+-GUXcUSF=A-t45MG8iRgDJd6U=kR9OOG80w@mail.gmail.com>
Message-ID: <CAMuHMdX9-j307t+-GUXcUSF=A-t45MG8iRgDJd6U=kR9OOG80w@mail.gmail.com>
Subject: Re: [PATCH] m68k: sun3: Change led_pattern[] to unsigned char
To:     Sam Creasey <sammy@sammy.net>
Cc:     linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Sep 18, 2023 at 12:07 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> The values stored in led_pattern[] are only used for passing to
> sun3_leds(), which takes an "unsigned char".
> Change the type of led_pattern[] accordingly, to reduce kernel size.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks, will queue in the m68k for-v6.7 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
