Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0D41EB2F
	for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716146554; cv=none; b=isERhqhU/vEGQKHNGRI4CAESTANSqzRCXhf1XveIz3z4SpNYtGNp8gVM+2/9dsx2u9ckzMt8ObZO6iexdTlsVmnRiWrRUmWFc8By0CXNoYF+piasqSWXVh/BuXRMugCDcX1zIIl4AdPuH7SqkwfQdMr4RzYwWJNP+9eIsFXnCZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716146554; c=relaxed/simple;
	bh=JopSbVrSldD0iFOS1hs6GOCJgVCVt8Li6OCVEXiog+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K95aFCHvQQXtFcMNLx+4Fr6PJ+77SAWIH+WGv+D5iVnUSy2hTLuE/SNap+1lF487zB4iOf5mTmkcUbSxLvfwefFfeEOEcybsgq4ab/jXBsPh0hg6vYRf+rQU9F/i+G+dn8LgamPwSsyZNNNvER2Q9K/ugP9o12q2YzttzjmjqEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyCG73ow; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyCG73ow"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso57368935ad.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716146552; x=1716751352; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jbqrp+6zf82T0Ko5nFLwJJVIDleIX63ZbuAELDBXlc8=;
        b=RyCG73owUcx2gTXm2uUalrT3Qq/6SK6ova2TiakXHX6whj077MAnD6SRdtYxuTRUWU
         MM4iN9f+JYMQxQXMfhCjx8uy31CmdtNGaLJf44SgGIqLPEPZMufDlXHITRvedq1t3Es7
         eYZYUDuyC4WBTBtYHlKH9QcCB3YDnxMzed7akNBZHsEWvVO3q3smJ5xn9lwjAycXcUU4
         /ZM051HVsojCCMhIRERFM+fhNB2OgYTFtRpL8421YPimTIdG84IwGRbUJ/2URNyYKEMJ
         HJxmmO0V9kdFTVOfTg4W6mVe3UUY62kyWzN65N10E1jk1YOMOeDqSofqBdUx4dD4gi0Q
         kIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716146552; x=1716751352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jbqrp+6zf82T0Ko5nFLwJJVIDleIX63ZbuAELDBXlc8=;
        b=j1eyggNDHYVsTq1J3c+0s2NxKqfDQGER+ezIO5n3jZUtMp4XncL/9gQivCKQ4bglBo
         hivUvi1kiuQnmhaUKLlzptTFWGALbTBO2Sqj7On77reEaKAaYXlqqtoO/+FKRIF4ppMR
         qjL/9vey/zGVv9bRpaKphrHutA2UjITm+ZJQ/CTVmQNPKLg6Ybt1bLki08XlSCwISltv
         jHEVD4l3yb55+b+UVYQK2MGbPMtqEBGyv252N5GDq/Rpu/S9k3jWCqkFU4QPxcAoJyzu
         ARGsm2JEllcqCHzN23KAA6K7LujTDC2WCmxUQiKQd7YB+TqxnzNl0Viq3wS7el9KUtKk
         0Fcg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Xon9ZMUwPM4AUBAiM3T4QSs8lBw9Hh5BORoq29uzjrXRqUGczVT0S+JLPfl4nfDxgDrzEpEB8daiHFB8IyhKZIXBe60aG5k0Mb6GO9WX
X-Gm-Message-State: AOJu0YyoL/DaGj1AiTmbnqjrO1AXb5dGekDWSBreIL++zYrEK00aK2lW
	VnJ0JRzGVYsLY1U1I6gEqc7PNfQeUlP+NL6KS6Q8+3v2MthyGvMQgSAmrg==
X-Google-Smtp-Source: AGHT+IGG2+7a5++fMqhxwl79bl9gcNH4mWUiiH6/sHxxDZvA6/P/wp5NaADSFfJaocNQpPSoheP6xQ==
X-Received: by 2002:a17:902:8f85:b0:1eb:1af6:e7ea with SMTP id d9443c01a7336-1ef43d2e9abmr260957335ad.34.1716146552044;
        Sun, 19 May 2024 12:22:32 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d4828sm188449855ad.20.2024.05.19.12.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 May 2024 12:22:31 -0700 (PDT)
Message-ID: <6321b7d3-ee31-45eb-bb5f-28a2c74cb7fa@gmail.com>
Date: Mon, 20 May 2024 07:22:34 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Amiga, serial and SYSRQ
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
 <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>
 <CAMuHMdWL2S1OMS5ikKgQj2uohoiL6_a5FLwdCphUEBVtMOSFcA@mail.gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdWL2S1OMS5ikKgQj2uohoiL6_a5FLwdCphUEBVtMOSFcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

On 19/05/24 21:17, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Sun, May 19, 2024 at 9:37 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On a serial console, SysRq is BREAK:
> s/serial console/virtual console/
I meant to write 'serial console' there. You will note that I carefully 
avoided the topic of sysrq on the virtual consoles because I could find 
no information on the key combo,
> Amiga keyboards do not have a SysRq key.  We used to implement it
> using SHIFT+ALTGR+HELP in the old drivers/char/amikeyb.c, but that
> feature was lost with the transition to drivers/input/keyboard/amikbd.c

Thanks - same problem in atakbd.c. What key is 'KEY_102ND'? Does it even 
exists on our keyboards?

Cheers,

     Michael


> For enabling it, you can s/KEY_HELP/KEY_SYRQ/ in
> drivers/input/keyboard/amikbd.c.
>
>> On the serial console (PC style standard serial ports only)
> drivers/tty/amiserial.c does support break, so that should work, too.
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
