Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED28FC433ED
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Apr 2021 03:10:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE703600D1
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Apr 2021 03:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbhDIDKc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Apr 2021 23:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233328AbhDIDKX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Apr 2021 23:10:23 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CE3C061764
        for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Apr 2021 20:10:11 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d124so3259114pfa.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Apr 2021 20:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iY6PDGzEpDlFZ5JABIVINiXcyV7OXe1c5LxQqA7OAHw=;
        b=IzYYpV9dHKjHQvb/c/mppIoj7Wg5xm7bLRt5obXAc+hZaC1pBsAxOJPEg74gi23Ere
         4oLU87qukCBDi4mkJIl37V6ct2ZcoP29U53r7Wj7kVecXnl/p/TLfQIIaqdYxMM59c/m
         kP5t4PhTjmHoMViKVliKCsYwTPPD01EjTYGOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iY6PDGzEpDlFZ5JABIVINiXcyV7OXe1c5LxQqA7OAHw=;
        b=JfNpstZVVizkapmQfLO47UtZCiFmp4rCUBZAajSSZ+yh7EFGHITyWpQNTUl/gwvOvN
         I7IyQTM3sp1YsjUk9Hs+m8CJ6XGkmDKImzeUy3tiP8RtptG6Q7dxcUZLCrM2ISgoAbuc
         5TcSJQ5p5oddD2noJRqQ+Kiuy8o7drrc1aNXYl7PWJR55wFZ2m6THEcyYiEndK/fOQKV
         d4jCc6f+PmoZOrLAqUUb2MP4be/HvvTVby/+VLN+bAL1ui/akufqzfk4qNnZbYKWinwq
         j2RZZpwLPce9m253DIR47vZZX55akmnThSeajc4/lklvBANpUFEjmB+ACIqUV/UjYgSL
         I9Uw==
X-Gm-Message-State: AOAM530V8G3FZ2kmoZhy3ubn/xyhbCwX58bI+t393ZwNFWUasKaGWhVN
        4fVVS5IuD7mHRPlghIQil6Ycug==
X-Google-Smtp-Source: ABdhPJx/DSDGdnbMIOkt4rPA2fB7bv1H2RrcmVv5V6WEDPg0VVHm/QRB/6pSWedUGA/ZcEljLEdHTA==
X-Received: by 2002:aa7:8498:0:b029:1f6:8a25:7ade with SMTP id u24-20020aa784980000b02901f68a257ademr10530825pfn.76.1617937810322;
        Thu, 08 Apr 2021 20:10:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d4sm632353pjz.46.2021.04.08.20.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:10:09 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:10:08 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH 12/20] kbuild: m68k: use common install script
Message-ID: <202104082010.0DE93225@keescook>
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
 <20210407053419.449796-13-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407053419.449796-13-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Apr 07, 2021 at 07:34:11AM +0200, Greg Kroah-Hartman wrote:
> The common scripts/install.sh script will now work for m68k, all that
> is needed is to add it to the list of arches that do not put the version
> number in the installed file name.
> 
> With that we can remove the m68k-only version of the install script.
> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
