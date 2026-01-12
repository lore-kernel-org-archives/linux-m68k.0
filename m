Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442AC374183
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768240414; cv=none; b=G0uLtqaXaOb2wkZupyo625/zikk5hy9tH50GDzi1T6kxC+1cToEhY+5VSmo2CVB6780VpqH06s4HhiXPKQNKN49V2NQkOqOv7PkReP65WvTxAVq5bB8x671u6FAQpS/h+7ANZ5cJKQqo4A0PX7bRFT4y65t+5dyfDWxDTSxZZfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768240414; c=relaxed/simple;
	bh=y6BPssvuqQ/qH26ZtP7OKYRtO9FGOS74oztLC07SRNg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pXLcuNGU7O6E43WPIWN4Amc0mUf7ZBddJJFr+gUDkh5S7Z02TRIvCX3cQLoRrd02UQ/Jtmnv7Hrzzm/RiIU19lgN0XNU5nn45Vv4MUIRVAlGwiRifa293mEaO2xIkau90EBFwgoqoniCGqmM904MWoOWe4D6J/2YqOq6si/dgV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y6iIxLyu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y6iIxLyu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so73554705e9.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 09:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768240410; x=1768845210; darn=lists.linux-m68k.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y6BPssvuqQ/qH26ZtP7OKYRtO9FGOS74oztLC07SRNg=;
        b=Y6iIxLyuL5LCkWVmSz50hib0dhFtO0A9UQJ02MnBHubNgxJqlPvPz+LGKc1Udqr23M
         RYkg+1WqG4sNrwfAlFA3cdA5fZwbKUYdRJpMEmgdUihU7D2evgsB63/Wl6WqeZcYZT4F
         5BsKKghGr7C4bvQOgwz/OInJvCcrovSN+bQB4ptRc3IX0tflIRv+v+FBhDkSLTVByrTM
         3/uNZyEuby3yW7ilbpCmQdyuQdyObBmHIqxaaAMeZMpF6+jT+MQsjscRD/rqPARYhP8/
         Dmobmghs5DCHxNwbT/BC1sdU94hIEseKUhNaFeH9CRNTImIfoYr9rDa4X+ovRAEYJOzJ
         BhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240410; x=1768845210;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6BPssvuqQ/qH26ZtP7OKYRtO9FGOS74oztLC07SRNg=;
        b=CIXLba/lnhTaChLjuJa1vJr2HVwtIpAA9DF1j/SRckOEWeTntpyHNe5UX1ZXH6lGdV
         jGMubDCGwlUrAKsK8mNp6J0sqSeRdP4IdAsfzlhe4lUxcD1dZ7bWLsAzE+LhEK06rltC
         mRhppkMO5qeJHfzwI38LBkZjnx12WIM/hCL0OU7MxTg2RIFA6mYHIjUQ3TSogdgH7fEv
         IsuyhFuH9Uz5VDz3735aseOMg8Dz/Ybldhg0bfm9eZ5u8m4KlfvaUMnn7ucxLSD1hocO
         rVAJOwiWoXiNJTwFxE7L6pNDdXFq8IUxq4WaG26k92iC8yqjwCtYk/n2pjOZkCML6PIV
         80rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSKBhCzX2EZpZRFiZAhqyPopfitmA24kgPQerH6oqAorDNZ8xcGrZDtF3hMyqPvHpBFnHL8ih7kiFJ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwA16dhBgDHA28AhGYW/CJpEBAlEPXzp5dl0WUNDlohLURYqhki
	IrKzKEjOX6Kg/msdpGlapLC6uIA8Ju4Ujzjh7XUkUzQMCzibayrmT+sL2R4jDcxZNrA=
X-Gm-Gg: AY/fxX7zB9OLiU7r/KOFYbtr+dmmgCQ2bAJTEb6X0FemwygtSefAyExTRkVBjsWOJiS
	2Gfo882X8zlH+NZNuVj0SvSfQsm28gfNKrp0EwbVh2HLSvrv8D8RA7TdrxTh1YevincKWZiJASu
	r4JI63UcmFsj/faDwoo1je16xFeTq/GA+FYejVXvh8DgTtvCV8DqiZNXKYagSDSyPU4neg3h17r
	6gL8dwH2GZcijINVI+AOWMPvRPyrzsjGufsVZst3zf8Ifv73EiRPjYZOW0vpGisgEefQC3jQl50
	MlQU9ZPd+F6uT1vvGa44KVCJTDLTRyFM8S6HlOzJXw8pXesnid0YIjTYj4wkTc2C7sKNkqCdsv3
	YiM3ge0MM0gl+AurUZ11bxajDOO9LEo8JXn7BjpShaWBMfYj/pBg88dek2qnqEpDTZAyccRgzGh
	fORteB6oS0aJGBxIe+1cS+d9e9EWvSd21xG/Pj7Cjl5A==
X-Google-Smtp-Source: AGHT+IGfCgsoYudB43gyY5VgiMyajRCyMKVvdA/K1TPc0FTW2J7Pqnzu3xNux2u9C7uenfxIM0LM/g==
X-Received: by 2002:a05:600c:4e8a:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-47d84b170famr247229235e9.10.1768240410449;
        Mon, 12 Jan 2026 09:53:30 -0800 (PST)
Received: from [192.168.3.33] (218.37.160.45.gramnet.com.br. [45.160.37.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f69e13bsm368953115e9.7.2026.01.12.09.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:53:30 -0800 (PST)
Message-ID: <0585581cd2f19544c5e1565a9d241697d812b5f9.camel@suse.com>
Subject: Re: [PATCH 00/19] printk cleanup - part 3
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Andreas Larsson <andreas@gaisler.com>, Richard Weinberger
 <richard@nod.at>,  Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson	 <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Petr Mladek	 <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, John Ogness	 <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>,  Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook	
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"	
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy	 <christophe.leroy@csgroup.eu>, Alexander Shishkin	
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin	
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Laurentiu Tudor	
 <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Date: Mon, 12 Jan 2026 14:53:12 -0300
In-Reply-To: <836139d1-1425-4381-bb84-6c2654a4d239@gaisler.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
	 <836139d1-1425-4381-bb84-6c2654a4d239@gaisler.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-01-07 at 11:22 +0100, Andreas Larsson wrote:
> On 2025-12-27 13:16, Marcos Paulo de Souza wrote:
> > The parts 1 and 2 can be found here [1] and here[2].
> >=20
> > The changes proposed in this part 3 are mostly to clarify the usage
> > of
> > the interfaces for NBCON, and use the printk helpers more broadly.
> > Besides it, it also introduces a new way to register consoles
> > and drop thes the CON_ENABLED flag. It seems too much, but in
> > reality
> > the changes are not complex, and as the title says, it's basically
> > a
> > cleanup without changing the functional changes.
>=20
> Hi,
>=20
> Patches 7-17 all say "replacing the CON_ENABLE flag" in their
> descriptions, which should rather be "replacing the CON_ENABLED
> flag".

That's true, thanks for spotting!

>=20
> Cheers,
> Andreas
