Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792714942;
	b=Wm1tEHl8X9pjxR1XqYruEWpuYB5BdKG/D0foSMViZRmGuUV0974KENqaV1p4UFGY5kb4
	 cN3BBtaV+1Eklmy4zEXT/XjdwpeUEHLZ7Pk2EWs4Eqen9wR9rHHg8QQgEsO7bSYqhZUSX
	 wdX4fPAKB/2kxRSsrKNTb5Ea+4pJ6vwdTGCBK0rFjqnZYSp3I0tzYmArqDseA5wOmXffa
	 ViL6gA0b7KW0MV0utJrFKBtHAsji0Zzi+XEFcVno+I3rQNFpEDQR8SNsVjQullEtwwqpE
	 o2+BToX9EiaIYaJAqreSUfdr20cadE78rhKVOvTdb/NiX3VH36UQoYkeJzw8doZ4YYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VkjwhNqrhec49sZYnWQitZbiXMreHiWthFexlaEi7O8=;
	b=vqIKtPPjisetzyZbDHbJqjsRQ3G02xol/cZL+nmKZm3R67pn0ChKT6mjx0Q14r1VYOhw
	 s6PFd6KsR27UkHTIM2tAnjKKsb8m5RjUdRUU8/qC+KtR4mSVpZqtGdtrQlO53P96oEb56
	 ht9y1uokB6RxFgVTpDfG4gbRUFqWENc9Vij68wUqPSbqxOqKFLKjUF6bKuYVIa1iNZq8H
	 ktKm3kQY+AOf6UmECK1b0yzQgLbwjU3SzVdwj5ceuvh2wI6yIEsAmDCjxzyWCd5Bs3zUy
	 xhb7u01xB1g8SKAOLe+a4HEx6gQu+m3kgwcyoLmq1/d9BTfvma4eMq1Ta0Ssh7Jp75w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="a2Q/QNEP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D79606A31A
	for <linux-m68k@vger.kernel.org>; Fri, 23 Oct 2026 00:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D79606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a2Q/QNEP
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67a000ac7efso429346d50.0
        for <linux-m68k@vger.kernel.org>; Thu, 22 Oct 2026 17:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792714936; cv=none;
        d=google.com; s=arc-20260327;
        b=fkgtkL3iMunXGSUT8d6rUKcNbD7gMxDINdPL5ZkPOcpez8co83wTfLcaFNYlaamz7w
         vJqub6ZhdSgYtFaI+ww/CizVLyZza4RShIg8ZAWpimKyNqNcmUxbAlom7Bi6S2KqVQi/
         uFDV0RdjkOthNKRgX6Qh2dX5aC8eFiMX4PRgE54ddNQr505nfE/DnisfOIezNzEvNiyf
         ls++XgzbwrU1RCM9NNLaIfOKyursCUiprKc2SlIcloq5nJ1CRTkgSlVwie1NuYJdL59l
         ZcViDj/kuxvuX9u4TX2WrXCXsAM3LZoAIj77WqQPeH7wwyojlu/ECWMsqBKm5Y09Q5Hq
         +wqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VkjwhNqrhec49sZYnWQitZbiXMreHiWthFexlaEi7O8=;
        fh=NHKRJGzf2eKq091ugVmPycrwEAT/tvvPd2R4eziYT5o=;
        b=WDvOFZJS5VIPK4T3Wri+3yQnH4+OkD9+uzKVeb24s2i7IYusfEsVDHriK9/u4eRrRF
         D8Vxp35P7oQwlL+IyEVy9qPu+48z+xUXWSzSAqsYL8gTsFVW1CGtZlWju9/WCHDDgqx5
         bUqz7fExeLV20Vh5jmMh76JkgP1Aer8cMHE8ozrB+ZihsDB7dmZmmRx3ps6wOoTLQ6kC
         yQ1To/lu5QQs0Hrc9ZYjshCnGeqcyaJCpuzAFbIRPzZYbzSumwZZcusdj4y3/jLpJpKT
         K1Az/IWZKt3eTJrxKC2Z6x6zJUqUjspe6JCE+SAMuVhIFknnBJvMaULbTxTeM7xyAJRV
         hJLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792714936; x=1793319736; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkjwhNqrhec49sZYnWQitZbiXMreHiWthFexlaEi7O8=;
        b=a2Q/QNEPVSrvDNMXrTz8Ym23NxEk5ci1YdoOZqJzDzRlxCCmeMlhVNZT4k+TgGJjE4
         drbaoS7zagqDU8UariXTlHj0GwZm+Ix7NJoHVb5bC54biwZ8vrn5PjKaQNROo+tN5Fno
         c9D4fuyN7aB1HaRqWCNnUIdt6GMTfMS/0rK4BtEKy2oD56Dmk7yMYmjUrGTn4tGidIWx
         Jyj+39h1jXivxlrMnrAUmTUshE6yr9am6JQgZIWIUdXYwuTJRr21mGTv9ftcV7z1DKxL
         g6RZh85aj9lldhFoYVzEMZzUfNSMhSNHehbLqTSV/CDpZZRExRtfjju1hgSb6RML+lEv
         tgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714936; x=1793319736;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VkjwhNqrhec49sZYnWQitZbiXMreHiWthFexlaEi7O8=;
        b=MyPiU5KoUMdj/LNu2/RfvlZ1+PcLm5qyvq7T82nAMyXsytToWmJJ7rtEvQzoSC/rUI
         wLzqObPr+a7gR5f9orWy/Mw8d3sf8Vr9wbPfb5x+9+lBuRIBHGCiShwkLbVU3bUYWS08
         7ojBUwh5/dYtVe6cSkh0pSceaYms+/kYH1Rbfn7v/i1H4K+DGtla66UdnySlYTEkCYox
         zHXudXb4HBoPioK5eiVUCpjbYl2K33rndBqJo3QMb/HrpwGaRlPF+22/N3MPZ1Ouf9BA
         JWtpRIHWY0NunZhCCtQjACkf2L0T3+OkM6cZ+qPcOZyV55qhVDyZjSz8ajpsOXrieWEY
         5Vsw==
X-Forwarded-Encrypted: i=1; AKwUvBySq87m9BybF3WaJlktaJmRxdCfJKJnfGsEFBIyowJjvMjtG1A+e0IbmE28zMYdMjD6ZiLB8f06lI96@vger.kernel.org
X-Gm-Message-State: AFq9FYLJMw94lO/b0Gex3abKaZCN+AQtI9PYoJC8Wa910k5YouTPeCQC
	VRB2h53YbWcQAgLgDVoeh3QGnAQiJP2EIoHniE8YCQ4/uHF+6lNXYSVoN9ehyYNCdVfwECK2Fia
	3+Prrdw07B6OZsXHsPEFog+Q5F+RnfIk=
X-Gm-Gg: AYBFou2NeXfcs5+ou3Ogjg+c/GK62Qlez8sMeeVomeoBx6uW6ItsWYU1tkCJ5uhrYhq
	9o3I7hEGy7j2T1/jVVSNtBvIXXgjvVFB0FXX2g0NzkOz+y0ZBsUCcRrz0jvmmLQNGYdolNYno6P
	m0K920I+vHjBSz13p//gG6CF62LWKHcGasxn98/T7Pd197bkfCK3D95dWflydsolPLBzw+TN6Qe
	wgVh/NCo5QFmEsw5U6U/lISFkwentn7PD4L3xIfd2fAkHmvYVL4W79EMw5wHmbg7REueapUk81e
	m9nAjrPlrTpImqxy4za1nSXxtHf5UIyxlCBjW3488NXJc8vS/16cZzHXpEp5fpNlZzPAqwvl99J
	rr1JVt0cydvVVvt/xurvndTHoEkn57czP2JZx1kxek/jEBm6tgLq6v9HDr83xSHe5cJwOKIpjUR
	WLehhYSB7MV7l9nrLHI7qwXbbKjXyV0YF95fu6PVNcOsVRWoHDErnKzUZWllX7b0yUeb1thDUGJ
	0K2f8EZOTDkxcXJI1rGjw6jfGfVBqdpmJBPe7miZEvcAfoLQXb5Qbm0QXcn
X-Received: by 2002:a05:690e:1507:b0:679:97d1:4378 with SMTP id
 956f58d0204a3-67a35bfb62fmr416506d50.51.1792714936009; Thu, 22 Oct 2026
 17:22:16 -0700 (PDT)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021000338.2160223-1-miro.kropacek@gmail.com>
 <20261021022336.2232886-1-miro.kropacek@gmail.com> <c77944ee-f170-ce57-9065-d7d49fcfed6e@gmail.com>
 <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com> <atqTLxkEusWSS-wf@google.com>
In-Reply-To: <atqTLxkEusWSS-wf@google.com>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Fri, 23 Oct 2026 10:21:59 +1000
X-Gm-Features: AclHuK-Y6Dnm1r5HCn5OEPDjtqeZI8Ly1qy0RvG-aD-4oneVDHT_0R61QzLB_0k
Message-ID: <CAN5rfbQWDTXZVyh8fDjxqRVO_HEKvWLC7Q_i-7aTtSxi9sWuSg@mail.gmail.com>
Subject: Re: [PATCH v5] m68k: Fix atari mouse movement
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, 
	linux-m68k@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Fri, 23 Oct 2026 at 08:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> Could you please re-post v1? Can't seem to find it.

v1 went to linux-m68k only, without linux-input:
https://lore.kernel.org/linux-m68k/20260814031745.17140-2-schmitzmic@gmail.com/

It touched only atarimouse.c, keeping char * and casting the two
deltas to s8. v5 is the same two casts with u8 instead of char. The u8
can't stay in input alone though: a char * hook doesn't accept a u8 *
handler (-Werror=incompatible-pointer-types), so the arch side has to
follow.

-- 
http://mikro.atari.org
