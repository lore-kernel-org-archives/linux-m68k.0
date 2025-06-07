Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FD415D1
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290564; cv=none; b=lT5SLiPkUEGwPxIduLTKg+emUkivQr0EKTBqBTAukLKsMa+aMfL3l/E9tbzd5JBufO6RWhw+Ta30BwHs143PnzQhhWMYba5/VElCpb4AMbrTxh9mEV571Xus/aES8S1FBNrshROil6Tz+dr6Rqyw3FWNxP5HrA1GuHqDMns9uJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290564; c=relaxed/simple;
	bh=tPybxwY5gRS9ZtvWDRMPSDHenxs20vzDc33V5D36Dl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/Pa8MfTIdXlwb51JrUfXtjDkb+cTUghBymq0C7KIeeDnbUOHTgSRSfwWb7R9MfuS9YvSU+wSLTDPwVUlKE3o73J/bYGlyxTpz1KVcIv6grEn4n9U7AtyQ3zQYXPMxi9L113SvapdJBu6gD4Pn6h1KUkm9NzJ7ZGiXuL04BY95A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tethuvudet.se; spf=none smtp.mailfrom=tethuvudet.se; dkim=pass (2048-bit key) header.d=tethuvudet-se.20230601.gappssmtp.com header.i=@tethuvudet-se.20230601.gappssmtp.com header.b=UCh+JIA2; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tethuvudet.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tethuvudet.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tethuvudet-se.20230601.gappssmtp.com header.i=@tethuvudet-se.20230601.gappssmtp.com header.b="UCh+JIA2"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32a8abb1613so2868561fa.2
        for <linux-m68k@vger.kernel.org>; Sat, 07 Jun 2025 03:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tethuvudet-se.20230601.gappssmtp.com; s=20230601; t=1749290555; x=1749895355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+2UdhL65JAsWjXvkcSHDNO/oU1J71LGi/o9cFVvTJ84=;
        b=UCh+JIA2Znrqf1P6CJhfycsYWjIvsV30e52UZq1v4ibD8xj97ZowfTlq2TLRAy3XSq
         kkFIdXph+mYEx6AE4pmfym3+3oOz4XFKIHZM/48clHHNB/IoS0hfqAKU5nfQpchIy1zK
         0jQY4HUIkYzSMrzvv5B+Z/qqghK17WzCR0rBKIJo1tGJv+6EEGlODQMqpLKC2l1I9Wxo
         Hen+oag17PwSTw65cOAGrXnVhIm4EiXXzZAp0Tx0R6lRzZaaRIxOVtR+IYi69FSQLgyz
         fP09N3G5VoqiI7irtTeVsTF0LQbk6Tg+8YWW1w+46Tn22DfhG6mWsfW0kBB41HhVFqkr
         mnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749290555; x=1749895355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+2UdhL65JAsWjXvkcSHDNO/oU1J71LGi/o9cFVvTJ84=;
        b=tIqFveXfD9klJIeWGyHMMJNoX+E1nmChaghBDUE0XmZe1m80RKalKJT6fsg+8KmsiF
         jPg+vuKh2lzz05OKAxoI2FK3hcpq/kIDQusnrsZX9elW7OhtPrqrzME65M9TaDSrLq3M
         gsQ1stfaGBJWtisTUu5npMx6K8dupfehj7+1TUUIsFM2foXJqbp5LnMXcBkv8d0tc+Lb
         uuB111pU1x5QN1DQeDfU/MZdDzNeY/HHgXl9YqzvIEVmQcYr5qPVKxU0PQsC9fmteODm
         eMFIHed10zGF4tBCqoZFauixtXmvNVFiPMVcf1xHI20UdQy9o0vXbBoXAsBR2oSjXGj8
         wANA==
X-Forwarded-Encrypted: i=1; AJvYcCV5bu2KVEPgribH6yhJTpaR736mNYDt7kwGTxH7m87XHZ/XU397/UadOYWXUJldn/nXrDY3or1WfbSN@vger.kernel.org
X-Gm-Message-State: AOJu0YxVwwJM8jpifcM2oMPsNtxi3YOeEf4YPNgjHmJaTEEpbHfTVPEo
	pVyg4N1HqZfLI1D6hTBT1QoQn0+2zRHpP+qxNnSXefF8e00xxpaaLrX87CAmpjb/SyrokYa/mqv
	IN0W2uLk=
X-Gm-Gg: ASbGncuhMemLrT+BXukeJ7SuFO00Ag77N870zirdmyR5awV7Uv+so1dtpKsX/PyNVYL
	svGhKVFkaMPcgTWO4RpIlThGJwTeB0mx/LTdQGSjVjaOH4roqYA/MPK5Pn5R5SJTxOPpP7LkhcC
	LJ5VZcp8nU6oVUlY2kW4oyvbuCP2UU48WLoyKcdMO+dLPspuvNu3EV3+zd7/IJq7ocodXwK34xz
	BDAqWAElALZyhTmrJc4savetyuUN6kUigpi/T9SS0hJmKAvpLYL/0OfrF0Lt2Uez9UoMQei31K1
	VamimpAgCT2LQ+AS3em2DksGdK1tRtTn0SbkNNqIMQClE0nsvxip98gkFL7jPJKeMLbjDCCHkzf
	wzq7F7UtdXdWTMIWtwlbRFC/4
X-Google-Smtp-Source: AGHT+IGb9Yt5c5dXjYX7cyofjvNVGvqqf6K/lIsfA/1djAPBxThuxrLPQf+dAD8GNdj/btYKq794fA==
X-Received: by 2002:a05:6512:1156:b0:553:29cc:c47a with SMTP id 2adb3069b0e04-5536860fd82mr554756e87.6.1749290554995;
        Sat, 07 Jun 2025 03:02:34 -0700 (PDT)
Received: from [10.198.177.219] (90-226-0-12-no2310.tbcn.telia.com. [90.226.0.12])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536773105bsm457651e87.195.2025.06.07.03.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 03:02:34 -0700 (PDT)
Message-ID: <cb873001-0287-4a60-a793-07b553d92224@tethuvudet.se>
Date: Sat, 7 Jun 2025 12:02:32 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Andreas Schwab <schwab@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <87sekbq3f8.fsf@linux-m68k.org>
Content-Language: sv
From: Anders Magnusson <ragge@tethuvudet.se>
In-Reply-To: <87sekbq3f8.fsf@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Den 2025-06-07 kl. 11:58, skrev Andreas Schwab:
> On Jun 07 2025, John Paul Adrian Glaubitz wrote:
>
>> Who is "we"? The official(!) ABI says that pointers are supposed to be aligned
>> with 4 bytes, not 2 bytes.
> No, that is wrong.  The official ABI uses 2 byte alignment.
The paper copy of the "System V Application Binary Interface" for 68000 
that I have here says that all pointers should be aligned 4 bytes 
(figure 3-1).  Nothing else.

-- R
