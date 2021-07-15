Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789CDC07E96
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Jul 2021 05:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C5566117A
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Jul 2021 05:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhGOFrJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 15 Jul 2021 01:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbhGOFrJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 15 Jul 2021 01:47:09 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE23C06175F
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jul 2021 22:44:15 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id c1so261432pfc.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jul 2021 22:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Cfo51w5fWbZ5YfkkpqjGiPlVpSeAOP7w9tw4E3E/dzc=;
        b=hei+AzcylVXQYdVxz6wdSVK+CAf3Gx0HHxkija5dUubrfq7DWO1PpmAuzmi2+ys9Uz
         xXbYzOpDx7/sD7ZAEwk+GvMBw5vzFfwJ+p5bkxL7JrnuXVheOkZkgCi5Vd82dSX8BfWN
         yahu1sI7s1QmGkT1D7sgmBb84H8PISJBxfVIUwbl70JR+JW1kSx7u+fm7pMv+BqCpiDm
         dyg/cpde3IwVWc9CxWlm/whPK7OAp4hOdU7I9/pYN3YAI4dfLnFbodi/D7OubkMGWSws
         lwKgodj5rCluhxO0ILh9gFi61pLQdEwClIJDFi2/9UQJbh+yxmJOj6c+nZrkLFqmR2Q3
         vR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Cfo51w5fWbZ5YfkkpqjGiPlVpSeAOP7w9tw4E3E/dzc=;
        b=N75yNtRgXKSNV9tPa41t0rX+JcxsMu5MHouujxoHEAPlV1qF7Gmqi8fgBFHyNf6nGd
         5HteF55oLuajGubF6gV6b2CvTHOmiOzB6oJttmq/m0lfM4U72AKhSA2hhMfdBoLcuvXT
         9uHdc7RfFDCNxqG3AinSuuNNiVYApTL2T8/DCgxYZsxwEMYfgCgh+qzPytbIwkS5Wctn
         KTQbt3N1xrzMFKsnZuJVCkF8e3DKpRof451hnjjnTsbl8Q5cfDz7Q5eUPXifwnN0jnjL
         PW3bhUsNMmMym976lbFPNLWuP72C3bIjqGsw6UNJUVkUgDEPpD6TjinaoHZqw1zBrTFw
         dE7Q==
X-Gm-Message-State: AOAM5300N6Uev9Wg5Rdf/rZt6gj5DCeDcQlFxkks1fba1zYzXsWOsKrn
        vWxuxgA3IFBC8+Oq5B8gi2Q=
X-Google-Smtp-Source: ABdhPJyUkeAqMHgmhnROg4y7urmggLKELKZDOYM6LCkPvnTMM6c+0oGpLlQccG8Revf9Rp+Qx1lIRA==
X-Received: by 2002:a62:c501:0:b029:32a:dfe9:8648 with SMTP id j1-20020a62c5010000b029032adfe98648mr2718840pfg.28.1626327854985;
        Wed, 14 Jul 2021 22:44:14 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-37-fibre.sparkbb.co.nz. [222.152.189.37])
        by smtp.gmail.com with ESMTPSA id n4sm4941635pff.51.2021.07.14.22.44.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jul 2021 22:44:14 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Andreas Schwab <schwab@linux-m68k.org>
References: <20210709070132.3387689-1-hch@lst.de>
 <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com> <87fswjomtm.fsf@igel.home>
 <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
 <20210713054134.GA5880@lst.de>
 <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
 <20210713085419.GA22839@lst.de>
 <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com> <875yxcek8a.fsf@igel.home>
Cc:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <fcf9d847-0f41-9624-70f3-a4419c3b98bf@gmail.com>
Date:   Thu, 15 Jul 2021 17:44:08 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <875yxcek8a.fsf@igel.home>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

well spotted. I'll give that a try.

Cheers,

	Michael

Am 15.07.2021 um 08:03 schrieb Andreas Schwab:
> diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
> index a308f0b41154..578e643ec83d 100644
> --- a/arch/m68k/include/asm/uaccess.h
> +++ b/arch/m68k/include/asm/uaccess.h
> @@ -193,22 +193,22 @@ do {									\
>
>  #define __get_kernel_nofault(dst, src, type, err_label)			\
>  do {									\
> -	type __gk_dst = *(type *)(dst);					\
> +	type *__gk_dst = (type *)(dst);					\
>  	type *__gk_src = (type *)(src);					\
>  	int __gk_err = 0;						\
>  									\
>  	switch (sizeof(type)) {						\
>  	case 1:								\
> -		__get_user_asm("move", __gk_err, __gk_dst, __gk_src, u8, b, d); \
> +		__get_user_asm("move", __gk_err, *__gk_dst, __gk_src, u8, b, d); \
>  		break;							\
>  	case 2:								\
> -		__get_user_asm("move", __gk_err, __gk_dst, __gk_src, u16, w, r); \
> +		__get_user_asm("move", __gk_err, *__gk_dst, __gk_src, u16, w, r); \
>  		break;							\
>  	case 4:								\
> -		__get_user_asm("move", __gk_err, __gk_dst, __gk_src, u32, l, r); \
> +		__get_user_asm("move", __gk_err, *__gk_dst, __gk_src, u32, l, r); \
>  		break;							\
>  	case 8:								\
> -		__get_user_asm8("move", __gk_err, __gk_dst, __gk_src);	\
> +		__get_user_asm8("move", __gk_err, *__gk_dst, __gk_src);	\
>  		break;							\
>  	default:							\
>  		BUILD_BUG();						\
>
> Andreas.
>
