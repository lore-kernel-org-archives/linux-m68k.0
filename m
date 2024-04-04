Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52B61B7F4
	for <linux-m68k@lists.linux-m68k.org>; Thu,  4 Apr 2024 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712222496; cv=none; b=BeWsodJNeMkVCBwF6LtkzyhpEBuqV1f4s34rVHrdp4r4DVaRMyH6sETgxy7u2eT+KzC8LMQrtaAIg8uWV/Cp0K5whXwjysHgYSUdqJa4zLu3nhZ1QWbHzQQP1cSnTHDsSAxdVHhFfin2IPG19Ldu4uNedxVAdNVBJdZm1/Pem/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712222496; c=relaxed/simple;
	bh=IBtqvebZipirK0kh1olnmPcc8MM/cNoL1tv0Wtc1tsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRTf2mKkTDQuCVP8ixOGRiMtE8DEaaMWrcrosJDSoR0042adF2bEJhTEJaHUnQ4DUYXUHETRdjXwCQHZBerSkQWSaTT55cnD7r9IvkFlA/ArB2ZK6lvBBoC/Q5hnidjCYX64O7YEcxZpdUU0A6b2dzkTg9wXCVvgYWsU6aKF144=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2kbduYn; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2kbduYn"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56c197d042fso767271a12.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 04 Apr 2024 02:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712222493; x=1712827293; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBtqvebZipirK0kh1olnmPcc8MM/cNoL1tv0Wtc1tsU=;
        b=Z2kbduYnwPmGCu8gdnsh+LgTdRTMgufSBSCtLiHah1fuFnRX6cMISD2ECVe9l/sHYu
         vPwLfj/Quk2EMb9H0nMVyAurPnt+9krlVWaBb5uvXH+9PapgGoh2NH1QH+0kQ9uFK//e
         ReSSSlAGQuK2rh4e/fo7+a7ftSzXywYZLpXbmgWKjgtaxltgxbDMUx4K3vq99bZEnSSi
         6ngk/bYE7vxtEkALwyDm6xdlXHwop4wT1gXDlw3NIZhbOFBIrieonMcHVtp81FmWHXSy
         iKYiqXjgOcgjHNsiLMTx1/9aRgzKCbY9r6MUxQegcttn8L40ttywsv157dA5DXIhxVW9
         bAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712222493; x=1712827293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBtqvebZipirK0kh1olnmPcc8MM/cNoL1tv0Wtc1tsU=;
        b=LZK9DqjjJ99MOdzdbgCuCh4k4HVBeIggcbAXWbNyF50LGrpazKzCllBpWmpIpAW65h
         Vf+8Y0wPBx7i5PFYyHh6dKUDM/oJ8t+5ptnJ1Kz6wGxD2kyydNbgYk2Z7w00uQijMzzH
         c9Kp1zr9kNyywzZkwwzDnI2/yUL4i3ExPOBi3s8wSxqHhLGh5OR66hRDVX/wjDXyU5WV
         Dc+sKJkVP2n6umPt0D1kBxL9HYh1X9mMviWQuK2lstJD3kA/58JrpbYbCJ03Y0AyK5xu
         bSLl/jdj1ktbdGUlgpBM/52ceVp/UUCtwtO29kJgoO4tGkRzRj9iMWOCF2Qt4aDc1fRp
         lMBA==
X-Forwarded-Encrypted: i=1; AJvYcCUdts1oqU07cWYOPPWDPMMZa9bHL/ZfT/vQ8+112ALT640DkRxiKcHq3Q9rEvyb8YKCMEt9pMg1uBT7O/8EBXJ6PKT046ZbLBZqJvCtn5wx
X-Gm-Message-State: AOJu0YxINRoNfvohu7lPg7OxErEAooX8gNHVq0xQKKIbohNmiWkoSGHO
	foqKYi80K6zvgAhXGs4QGn5Rln1C0L+oOhTtz/2Eb9PumGnO7cXxziSfOGqK01M0ABILJPedDz8
	GkbdVjwpfB+cWl8+lEXFZnJjJ6Pg=
X-Google-Smtp-Source: AGHT+IEuFsWQzjuoFKH6xP3gUs4bjys7kjQDLGl7XjPe+GUjpbLrwsjQcVsY5ZtSes7AfzSta2BDUCPfEFFQt++PcSk=
X-Received: by 2002:a17:906:6d4:b0:a47:32b3:18c5 with SMTP id
 v20-20020a17090606d400b00a4732b318c5mr1130270ejb.68.1712222493009; Thu, 04
 Apr 2024 02:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <de576647-1147-4aa6-9d5f-aa6e3464fe1e@kernel.org>
In-Reply-To: <de576647-1147-4aa6-9d5f-aa6e3464fe1e@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 4 Apr 2024 12:20:56 +0300
Message-ID: <CAHp75VcQXQv26M1aLias2xnsgehqOr1PzX9sztSa_b1Ws=_L4g@mail.gmail.com>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 8:07=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> wr=
ote:
> On 04. 04. 24, 0:29, Andy Shevchenko wrote:

> >> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >> Cc: Nicholas Piggin <npiggin@gmail.com>
> >> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> >> Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> >> Cc: linux-m68k@lists.linux-m68k.org
> >
> > Second, please move these Cc to be after the '---' line
>
> Sorry, but why?

Really need to create a Q&A entry for this.

This will pollute the commit messages with irrelevant (to some extent)
information. Since we have a lore mail archive there is no need to
have this (the email itself will be sent to the list of people,
otherwise the Cc email headers can be tracked in the mail archive).
Also note, some developers may read git history on the mobile devices,
meaning small screens, this just (as for backtraces) simply blurs the
information with a high potential to lose significant piece(s) of
information). Last, but not least is environmentally friendly approach
(I'm not joking): having it on thousands of computers, scrolling with
longer time, power for compressing - decompressing -- all of this
wastes a lot of energy (maybe kWh:s per such a Cc list).

--=20
With Best Regards,
Andy Shevchenko
