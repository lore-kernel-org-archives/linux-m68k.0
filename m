Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE2DEEB596
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 06:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238456AbjIMGeM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 02:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238331AbjIMGeL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 02:34:11 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0B41980
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Sep 2023 23:34:07 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52bcb8b199aso8265848a12.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Sep 2023 23:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694586845; x=1695191645; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xivZoRLvn+KlDMwpBnyJeJwebEb3d7RlJsAeQ2v9Xg=;
        b=tAiJGMAa1Yci/lcCQVYGvAdxrlJ45dzo/SdVlJpZeKGMEI9sbNzJHyzR49e6Rt4eKP
         L/YJgQqoU/ebZAlB6XEKloCDx2GHKUTYh4A+D/PuI1sOI8bkLjqyxThwg6TFXmpVGZDk
         acsxpEfEYbQmMc9f0AfnOgf7Ur1q/62kQRzxCUGU/XUq5Jfa5gNObWahibGtBOSb93yT
         iCHdSweeqKEYpf5Ke5IvV5MYnNLhx6q1AEeXxmC/4l0BelzNUaGJ/mw6wt/UTbbvaSz7
         5d5VC981q7klWIcbs/KdBT5/X8vJ/+zk1/hOnNfqblrqBJc4/uJ+8EdvDMKWq2Uzs2Cy
         hRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694586845; x=1695191645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xivZoRLvn+KlDMwpBnyJeJwebEb3d7RlJsAeQ2v9Xg=;
        b=km4vz1QnF7hVH7OR4CdXExjdtC2z4219DBixLDTja5u1EiiIGLvmasTibzlog2EytO
         8xB8JIVX8iZEgMPyOyNzC06rvv76DWy/5eLOx2ZRWD0P5HC5AWMm4wpy99170nge2jcb
         9xFt5oqj3urlce7F2OKMEHpFO+NbifejB6zTQ27Ceqbvz45ki54nEF8LOKjpuo9K234x
         JAXY3DkjNViopGOb+57uUf4QwG1KCc2CwQwdxMA1HIhMb2LNXZOaVpGHfsNtz8AsG6T2
         n3PfNrlkqXNZ3UUmhuT0mRdRlNbZAqbGquByDCUxLHKB4Ths2UMJzBcstGExbraSqFee
         WsTA==
X-Gm-Message-State: AOJu0YzjYcOkYlS0T/IPj7o9q3/UlwQ862BOFo8A+tg+lzlafWsbS90V
        oYksntBaCFo0YFCjUObyEcnzPg==
X-Google-Smtp-Source: AGHT+IH7pVsLeTcuGo1IKYmY0OKmMz3guLsV/+W9YMk15RXLnYgeiGl9YmdqiaV6jYyLCb+FD4rIbg==
X-Received: by 2002:a05:6402:74f:b0:514:9ab4:3524 with SMTP id p15-20020a056402074f00b005149ab43524mr1452889edy.7.1694586845587;
        Tue, 12 Sep 2023 23:34:05 -0700 (PDT)
Received: from [192.168.69.115] (176-131-211-241.abo.bbox.fr. [176.131.211.241])
        by smtp.gmail.com with ESMTPSA id x18-20020aa7d392000000b00522828d438csm6829049edq.7.2023.09.12.23.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 23:34:05 -0700 (PDT)
Message-ID: <7a34d350-9583-9e81-5706-9932a03441eb@linaro.org>
Date:   Wed, 13 Sep 2023 08:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/5] arch/powerpc: Remove trailing whitespaces
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, arnd@arndb.de,
        deller@gmx.de
Cc:     linuxppc-dev@lists.ozlabs.org, linux-fbdev@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org
References: <20230912135050.17155-1-tzimmermann@suse.de>
 <20230912135050.17155-4-tzimmermann@suse.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230912135050.17155-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 12/9/23 15:49, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   arch/powerpc/include/asm/machdep.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

