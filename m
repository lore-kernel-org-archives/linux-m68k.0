Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A105FC64E69
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 07:35:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BEB2223AC
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 07:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgKTHex (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Nov 2020 02:34:53 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39905 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgKTHex (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Nov 2020 02:34:53 -0500
Received: by mail-ot1-f65.google.com with SMTP id z16so7900375otq.6
        for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2020 23:34:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pNNXqJ9ENfmgslaVj755f0wgkn0MqvtGANwyKwnps+U=;
        b=RDaxwWdlMV/dSEnohguMJkNt2MPfkADDG30LMZ4vJ2+x5hi9uf0q99uJtz9kGrA+ih
         ZZb5/t27NWTvnrYaEIXQDx9737GvKqfD3mylOaByDpGgp+/Q6xos9TyXvqra5CxaOlvK
         D059jdBtgQzZ1x8oqVih1zHS8ZPBRDEYAMDOlN9w6uDKND1TXSt7blRbTzOx8HEBKRkE
         Mek/a2bhM3p9eTdbAZeC9PyBuXc4QHsdp6T07nVjvsTS61jWNdaVfTnG02HGiPL+nhlt
         NFI0hbxPWRbVYgAHrQEd+T1uW0LpSgDq/MPr/EKjlTfMb/Eu0HJbVOsTY7KVmfUbejph
         cZWA==
X-Gm-Message-State: AOAM532Ykp11iaVUuGqHC+7Mm9qHdQXO8UwuISf7ca14eSvz3J8qpr8b
        y1F50VAj1fBO0UXcp9i2p63fmj0yEbnJhDZioas=
X-Google-Smtp-Source: ABdhPJxQXWdwAvfy3kzRBDaqKfWeJQ8FANhkQsarZdi2+r3ejjgPjBPOujM6dCfgNWlqiQvu8U8byIAm5fcm8EUhDNM=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr12104265oti.107.1605857692759;
 Thu, 19 Nov 2020 23:34:52 -0800 (PST)
MIME-Version: 1.0
References: <effef6339c919a4ef2e81a47e4383f712cdd7626.1605847196.git.fthain@telegraphics.com.au>
In-Reply-To: <effef6339c919a4ef2e81a47e4383f712cdd7626.1605847196.git.fthain@telegraphics.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 08:34:41 +0100
Message-ID: <CAMuHMdW08hPeD+Qe_HwzQCUjqkvawwrD+=oP6CvfKXeN6ds_VA@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Remove dead code
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Nov 20, 2020 at 5:51 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> Cc: Joshua Thompson <funaho@jurai.org>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.11 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
