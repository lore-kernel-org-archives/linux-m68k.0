Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DDBC761A6
	for <linux-m68k@archiver.kernel.org>; Thu,  6 Apr 2023 12:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236342AbjDFMLB convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 6 Apr 2023 08:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjDFMLA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 6 Apr 2023 08:11:00 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A4DE46
        for <linux-m68k@lists.linux-m68k.org>; Thu,  6 Apr 2023 05:10:59 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54184571389so735381747b3.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 06 Apr 2023 05:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ck5MlPzpVYxy8IU0ivZGLSHLjTz+SenFqhG42tF0DZ0=;
        b=yDqiyseb/CqE5ypXXZt5cVYOB3r6umqxaHTAc+XGEt3znpkBCw4fYieRuR+WA2ZSOV
         lrhAmX1Ej/eSeG8iwlmsaJ2SJCwz3gUTnFFIdzmcpJurggzgBs1Fk7SozILMsYQqoh3d
         TtxfMYOv8NgJ/Z/rmtpLgxiNTEH9bF5bcxB0yedxr+jluIr8Z+S1WavFIlVVAcX6BrkT
         G3PSaFDo0GW0v7EtMvfpVCIb7VPaQ5quGET2OKJ1oiMnezqL6ZpPOqbHRjVWzGkbX4iT
         v/68QjM7RjL3L62osDshKOzFjoRUcUBVFxah9z6hiwTR6eIpuJg2uzpBpbD0mEq51oYc
         IKVw==
X-Gm-Message-State: AAQBX9fC10kyTwJTEDyTj8jE5N5gUiG34L5JP6se72o95jsYgQ5JFavW
        PU/yD1bKo40J+hx4rzxMpAVMnDBD5B0xlA==
X-Google-Smtp-Source: AKy350aC5HUpe2iH60KIc05LqZPk81DPGMBH3dOngqZ2HBiOYmuGl3JZL18JG9FWwoyDalfg6BcCpQ==
X-Received: by 2002:a81:55ce:0:b0:54c:19b1:5394 with SMTP id j197-20020a8155ce000000b0054c19b15394mr528867ywb.22.1680783058199;
        Thu, 06 Apr 2023 05:10:58 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id n124-20020a0dcb82000000b00545a0818493sm273697ywd.35.2023.04.06.05.10.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 05:10:57 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-54c12009c30so22525447b3.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 06 Apr 2023 05:10:56 -0700 (PDT)
X-Received: by 2002:a81:a707:0:b0:544:4008:baa1 with SMTP id
 e7-20020a81a707000000b005444008baa1mr5540717ywh.4.1680783056332; Thu, 06 Apr
 2023 05:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-sunhme-includes-fix-v1-1-bf17cc5de20d@kernel.org>
 <082e6ff7-6799-fa80-81e2-6f8092f8bb51@gmail.com> <ZC23vf6tNKU1FgRP@kernel.org>
 <ZC240XCeYCaSCu0X@casper.infradead.org> <dee4b415-0696-90f3-0e2f-2230ff941e1b@gmail.com>
 <ZC2/Pi+M4rWw89x2@casper.infradead.org>
In-Reply-To: <ZC2/Pi+M4rWw89x2@casper.infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Apr 2023 14:10:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfmwPioxz3sbcYfw0iaBBfKG0Vx-cpNHtLF+MT5SSyFQ@mail.gmail.com>
Message-ID: <CAMuHMdUfmwPioxz3sbcYfw0iaBBfKG0Vx-cpNHtLF+MT5SSyFQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: sunhme: move asm includes to below linux includes
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Sean Anderson <seanga2@gmail.com>, Simon Horman <horms@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        kernel test robot <lkp@intel.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Willy,

On Wed, Apr 5, 2023 at 8:34 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Wed, Apr 05, 2023 at 02:09:55PM -0400, Sean Anderson wrote:
> > On 4/5/23 14:07, Matthew Wilcox wrote:
> > > We always include linux/* headers before asm/*.  The "sorting" of
> > > headers in this way was inappropriate.
> >
> > Is this written down anywhere? I couldn't find it in Documentation/process...
>
> Feel free to send a patch.  Generally, it should be:
>
> #include <linux/foo.h>
> #include <linux/bar.h>
>
> #include <asm/baz.h>
> #include <asm/quux.h>
>
> #include "local.h"
>
> Some drivers do this a different way with a single local.h that includes
> all necessary includes.
>
> Also if <linux/foo.h> and <asm/foo.h> both exist, you should include
> <linux/foo.h> (which almost certainly includes <asm/foo.h>)

Indeed.  Usually <asm/foo.h> should not be included directly,
except for a few exceptions like <asm/irq.h>.

Witness e.g. the (violated a lot) comment at the top of include/linux/irq.h:

    /*
     * Please do not include this file in generic code.  There is currently
     * no requirement for any architecture to implement anything held
     * within this file.
     *
     * Thanks. --rmk
     */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
