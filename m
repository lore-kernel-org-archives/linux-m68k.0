Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB2DC2FC04
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 03:57:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244227AbjHQD50 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 23:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347932AbjHQD5C (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 23:57:02 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0023C26AD
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 20:57:01 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bc6535027aso61352105ad.2
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 20:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692244621; x=1692849421;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx0C3EPSaXTGH1kpr50KvS/Og3atJj8g1HzKecrffxQ=;
        b=WYw4JtXsVK34InR8w7b0a+0TACkhj7JwM7CEjS+7Su1rtakvR1zSnKcNJj7V/mJBhc
         EUx2eUQ6lLzTWwuqfo/GvO4bGtwcNvrAR/mNAi2nEdJapqevh8rUFQgQtNUBqogoF/GN
         bH1Q+WnNm8IBfQSnGQgxDpkhDu7YQ7loP35aQ1p/f5YHujz7roun0vdZdRdiPARDscHL
         +WidI0OTbC3K3yxNtCe1fHydeO0NEizkEYHR+mBqHKlVHT5qlKq0wsvXSY9S+ttIbv5i
         yXr+i+pYggLo2Y+mR4l/yirTrj627mHT2E57r+b3/chxQdU80mXCB5W2fn3GDi3W365u
         pj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692244621; x=1692849421;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rx0C3EPSaXTGH1kpr50KvS/Og3atJj8g1HzKecrffxQ=;
        b=QV+t64vjbXp/z4cJklnz2qaM43jh5UkaOh08k99ie1Q/Iql5cOh4u5EPgVCMW21/M4
         zRfdPKw+WjLVsqHMBmmNQ4gZO/MeKVo7F1nr8COl0aANNcYwkg2YeFsik26aWasJ7vRR
         e9wZmYnrasbniKnOluQ44B1prwichGS08QgtyzgSf4EdcuFySfKew6y4MqxJSZwj+co7
         p9isTqHq7aIcOJYgWZ/L1XyY/TMTpsGiYRNoT3GYYuy0lQNY1usJLImS5WWFHgRVICpc
         B3ngqSOPPGD3AWGHI1MmDhEFl2oPkFyt2+bkUPVBOEj+Op25B/thAwqOAEuSUXRwuty0
         aU/w==
X-Gm-Message-State: AOJu0YwOWA9QZSA8a4XsNIP9q/9x5ZISUldZr2A93g3Z9mcQ5CI8VRTx
        0BLdG713Vi/QcMkADQtA2H0buZFbD7g=
X-Google-Smtp-Source: AGHT+IHIZJj2zALHjE8Gl688qSgisaAXuW9JWpyy24pY+fYkr9z5T14uLycPWJ95VVGyoqTMM0JUJA==
X-Received: by 2002:a17:902:e552:b0:1be:f3aa:6fa1 with SMTP id n18-20020a170902e55200b001bef3aa6fa1mr3752710plf.40.1692244621390;
        Wed, 16 Aug 2023 20:57:01 -0700 (PDT)
Received: from [10.1.1.24] (122-62-141-252-fibre.sparkbb.co.nz. [122.62.141.252])
        by smtp.gmail.com with ESMTPSA id iz1-20020a170902ef8100b001bdb167f6ebsm12321036plb.94.2023.08.16.20.56.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Aug 2023 20:57:01 -0700 (PDT)
Subject: Re: [PATCH RFC v3 0/2] Q40 IDE fixes
To:     will@sowerbutts.com, linux-m68k@vger.kernel.org
References: <20230817035001.8400-1-schmitzmic@gmail.com>
Cc:     rz@linux-m68k.org, geert@linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <fb01c784-a7ea-a9b2-6761-7ae5fb1e4369@gmail.com>
Date:   Thu, 17 Aug 2023 15:56:54 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20230817035001.8400-1-schmitzmic@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

$subject meant to say v4, of course ...

Cheers,

	Michael

Am 17.08.2023 um 15:49 schrieb Michael Schmitz:
> v4 of the Q40 IDE patch, split into two parts. First patch just fixes the
> bug introduced when converting Q40 to use pata_falcon, second patch adds the
> byte-swapping option requested by William.
>
> Please review this again, just to make sure I haven't messed up anything
> when applying the review comments to the split patches.
>
> Cheers,
>
>    Michael
>
