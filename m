Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7BF155398
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714072512; cv=none; b=A8SE2EGDicIATj8nnuAT+39KNpJEDHiFNAayIOLz4g5Awcbfb6EW0ALAlpq/iLpz2tgFoz/z+wiYqqL5AOTkUhsVGpT/4Gc7ka49DuTgJzIEAAW4L484HlRzBJ1TzncK/t9Iu8yeEB+kYOoSTxc2lxW5tgIzHD9OsxVQ0dBbS6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714072512; c=relaxed/simple;
	bh=azvEDgb/HnxVgQnkMYSF6dhSzB06gwRfU8zNWCkNgIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZMsIIP6a6wyumYFdOHRvdBtsaFroGUW3OmLumM9qbS5/r/RLmAP/qRxQNS9+XnYUSvPj0PJ2O9iyWkN5tYJWpaNoGG2XcWYDNVtftRmWKEWRjhJSmxpa4Qsf/PnSP2PY1KMkzU7vHyvzYOYUftCwx2r5Y4fTqD6RAHKN/UJ6tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpp4Pqx6; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpp4Pqx6"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ed112c64beso1381410b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714072510; x=1714677310; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1olYcWwbRjVfqKtrfmlMLhFzTWUIl++goa25JF3489o=;
        b=fpp4Pqx6WayG6xyfosI0kcn+XOAFifJpY9tL1P9kuAvWkurDEvplqxgP03JltiViMk
         jYR/B0jniyrnTegr89rMe7Nq1UXCJymoRkge8p1XazrAA8mumyvmBMn3mu5T503RNFo/
         VmEC4yO4E47kkcgyegLYbu6Qyudx+cYDVcecvF944HEPc/32z/OC8hoiVzm1I2832Koz
         7f03yyYA9+71qBwGhaf+wsUgK7s+dHgaPyb1CUhy4R8+1Jdo6c3y2/8+YfXCXjKPKWqe
         8CDmtILPY2wA00Gzun26PkAXK0UFzcufiLcwxkMRppQFBpEEHQVe/8WBDdbsTAoBMBIY
         UQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714072510; x=1714677310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1olYcWwbRjVfqKtrfmlMLhFzTWUIl++goa25JF3489o=;
        b=IjTE90f/DVxOKeFTeJg4/ANbryN1ILRubOmRcegiWzY/rqvXTCFTxjpjyLnyGQlJ8w
         L0dyQbCs3JdFca8SFCaKNQVfhV2VWajQjljwYmwbL5uAdH8/LHQY3R/ToKS4Ao3t1gQZ
         uFZ60wZX9H/peAqawtGnqkQRAwxKpjH8gUFZ422MNjSoZOawsKUBExfp8u0CN3XuP54X
         PpV8CaOi/tcU1a4mXOuPpfidOkO1uU3NmRSi3DK2AOKrarHKE3gVzdd/5DSIaK01SoNb
         UsJ5kskJTzyFQXQsMfjQ2xAsi1AAMsH4q6uRjOf9zd8FOXXi91aWrEd6bEXEsRzA2o38
         41kw==
X-Forwarded-Encrypted: i=1; AJvYcCVVyYBBGBkC4qY6lkKhd9MshW+Mhyv0rWVcJMm9xmpvjg483OMD4dj7DY9/83dTX6Y5Bt7CJgecTltBgcHYuUMJI7zYui2IlVkpjVehFYJy
X-Gm-Message-State: AOJu0YxSKucbZa3QrMpfXvpnykz9Uu0zcIT4EEZJqedR0D6AXnP3BqGD
	edzoGGl4ih1FKHn0e8v2c7rS2EztIOxp2FIQf7EftziS2S11f4ka
X-Google-Smtp-Source: AGHT+IHPWTgVLgGgXOJ9zmpADhnyMp23xessSDcFtDYLLcwgPzVxs05Vk8MepNy5j5f3sGpbCLm1uw==
X-Received: by 2002:a05:6a20:7491:b0:1aa:583d:6a72 with SMTP id p17-20020a056a20749100b001aa583d6a72mr732828pzd.56.1714072509866;
        Thu, 25 Apr 2024 12:15:09 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id p4-20020a17090ac00400b002a3a154b974sm13332182pjt.55.2024.04.25.12.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 12:15:09 -0700 (PDT)
Message-ID: <57b70e03-2672-4f27-87f9-481208173a20@gmail.com>
Date: Fri, 26 Apr 2024 07:15:09 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
To: Finn Thain <fthain@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
References: <20240422022943.13775-1-schmitzmic@gmail.com>
 <20240422022943.13775-2-schmitzmic@gmail.com>
 <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Finn,

On 25/04/24 16:16, Finn Thain wrote:
> 00464504 <__generic_copy_to_user>:
>    464504:       4e56 0000       linkw %fp,#0
>    464508:       2f03            movel %d3,%sp@-
>    46450a:       2f02            movel %d2,%sp@-
>    46450c:       262e 0008       movel %fp@(8),%d3
>    464510:       242e 0010       movel %fp@(16),%d2
>    464514:       2f02            movel %d2,%sp@-
>    464516:       2f03            movel %d3,%sp@-
>    464518:       4eb9 0046 44c6  jsr 4644c6 <__clear_user>

Not sure you noticed this - the 040 passed __clear_user without fault. 
We managed to test this one without meaning to. Exception handling in 
there appears to work OK (for the cases we're testing).

No idea why you have the __clear_user call occur within 
__generic_copy_to_user - it does not appear in my disassembly.

Cheers,

     Michael

>    46451e:       2002            movel %d2,%d0
>    464520:       e488            lsrl #2,%d0
>    464522:       7203            moveq #3,%d1
>    464524:       c282            andl %d2,%d1
>    464526:       226e 000c       moveal %fp@(12),%a1
>    46452a:       2043            moveal %d3,%a0
>    46452c:       4a80            tstl %d0
>    46452e:       670a            beqs 46453a <__generic_copy_to_user+0x36>
>    464530:       2419            movel %a1@+,%d2
>    464532:       0e98 2800       movesl %d2,%a0@+
>    464536:       5380            subql #1,%d0
>    464538:       66f6            bnes 464530 <__generic_copy_to_user+0x2c>
>    46453a:       0801 0001       btst #1,%d1
>    46453e:       6706            beqs 464546 <__generic_copy_to_user+0x42>
>    464540:       3419            movew %a1@+,%d2
>    464542:       0e58 2800       movesw %d2,%a0@+
>    464546:       0801 0000       btst #0,%d1
>    46454a:       6706            beqs 464552 <__generic_copy_to_user+0x4e>
>    46454c:       1419            moveb %a1@+,%d2
>    46454e:       0e18 2800       movesb %d2,%a0@+
>    464552:       242e fff8       movel %fp@(-8),%d2
>    464556:       262e fffc       movel %fp@(-4),%d3
>    46455a:       4e5e            unlk %fp
>    46455c:       4e75            rts
>    46455e:       4e75            rts
>
