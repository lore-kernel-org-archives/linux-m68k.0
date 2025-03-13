Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E935126989D
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741882514; cv=none; b=dIrRGigmEB8kqWe1clO5yxtnP3bG0kn9QOwWSXYR5qVPtkasNx9IfYhP1vy1vo5L0TnhCl+eQkDr5yysC6+OU2PvstZ8yliePDoJF3h5IbZdCWzflkGBnsA4fXZzPVkYF9pzrka+G0vADmJmQn6gv4RXGebV05yCWftBVxnFBQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741882514; c=relaxed/simple;
	bh=zmD7MNim/3VQcYsraUusSjJsXZ6QwmA46ppNX6yBUok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZx90PVSQSs+0AeyeFP4MQevrPYURPMIIzR7/neSqeKU8Nib20wTLLttNsJnUmGcrvkoSuRA2IIYki8VVYQoYGmi05HrRNZtvBhRCfGdaCy4HSymFKH8Tep8L6qCXwD1uUDAWIvaLtlDn+aIrN5Oo1k/HowQG33kjWl3RB4KyRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AeXyMrDw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AeXyMrDw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so11184455e9.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 09:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741882510; x=1742487310; darn=lists.linux-m68k.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmD7MNim/3VQcYsraUusSjJsXZ6QwmA46ppNX6yBUok=;
        b=AeXyMrDwZ90i6DoFybhU4NRZLCXinemPNvWsGCLNFHC6wBLcJBS/AEa7vsX3MTf1Fp
         IhuA4OP1K2y10ALqT3UEJnTIz9crDhtXBOeOGCAiDtYwDwmGMNdvuVlKZttn5J3y7bE0
         /nTkAu3rkSXhXXY/Gp15ybSNS/e3HCgvVOeRcQ9fG8Imv5SPaCWjXgyLDjXPz7CYRwdV
         JfsTfW4g8JyipC2gglpnWvi9nCW1HOlaYtMRs1v/Vnmd0OFcatp3k85CMRuem2SPqadN
         8+U7SMhp5KapmTAy36YkNZiY4T4OtJ+0l/4Sm/T8qFQb3R0mZ3LrZ0RWj1Os3czbZLMP
         orWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741882510; x=1742487310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmD7MNim/3VQcYsraUusSjJsXZ6QwmA46ppNX6yBUok=;
        b=NnHfrmTUVIaNB8G1cBAKGYR7vMwLPC1hcneGY82kpZSLNW2o7HgAvQfERYprK9iwZV
         0ncraQqzkwnKYTJNiONOwBjM8/rHQlVtrtBDUcfwdGLIu2EmWLxgsyr2iedEf7GgdgmP
         IBsHATe5r6LLkYOX+a4ZwoGPhNen2FbYIU8YbiP9mgV5qts1/NMpT6T9j44/T+rvaZYl
         6rAzeIl7SRA+F/WtN2dSf4pPi7VbnC/QexeVo9uMq/81kDgtX7+PnlXedgw6t4gpfGK/
         ZClt7cvJFNO+Mfluz5rMDoBlmw+IGLTd6b2/QZsIBL69uCYnYnd8j2fjiw+roHj2K9md
         Dk0A==
X-Forwarded-Encrypted: i=1; AJvYcCWJfhjIG1TkeeIHrpFeA3G09xG3qXyd3BcoHoXijCE0UCk481r8RrJReWPk0YLQZIFIeXM1ikhZIphj@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyQmJeCbcuh7+PrjM95vlQb25AJl+TA5NQT4/BOIojEDRmL4oWJ
	EMoK01QwclUpo7SwjrADdZ8PD42ZXiIKCigR57UW3bNCvRCAhlDeZoYNu9RI+Bo=
X-Gm-Gg: ASbGncvG4vKb4eec/0SdU3zKWVW4ZaHI4Zco7RLhjiqo5f05hrwHRvO//OR0mda/L+D
	1joVSbHmwiLRSR7S3H6TUhwxGKWgSE8t16i1jjT5DAjsRDExSSQTNZeU3/KKrsfCRFfdgexGYD5
	dF78daQn5LaSgy64NTGP7XjPPpl5TE63uN9P+aDBcp+MwfJIVqBpD2VmI8rS3hAoUtAjvFpNR5N
	4I4hgGJ1QklMcnogIe35s5xCIXZX2FJmqUYomjkOJpeLHz81TbaSbMOs2lJq5MzgiuL2K1ogcb1
	Bww2Ogi6a0FjQ/sB/tCrzZ2zRLLqylzaMwxKhTBVt2ORRow=
X-Google-Smtp-Source: AGHT+IFjIwacJKCHP0dnkNtlm25kdYN3UhdeehaflwmpbcpOVEH+KkVK3wJpO9PY4hmEX1fJPFgkvw==
X-Received: by 2002:a05:600c:3146:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-43d1d8afa48mr3000805e9.11.1741882510053;
        Thu, 13 Mar 2025 09:15:10 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188b0cc7sm25704255e9.3.2025.03.13.09.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:15:09 -0700 (PDT)
Date: Thu, 13 Mar 2025 17:15:07 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
Message-ID: <Z9MEi-hWiGf9W4gi@pathway.suse.cz>
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
 <202503072046.34DAF614E6@keescook>
 <CAJ-ks9kTO-u+Wqp0K-vdMLAs08fBeoovSeb_pGkMjSHFnBKysA@mail.gmail.com>
 <CAJ-ks9=zHBmOApsqa=UZcKtg1cH0tp34Kt9_5AEJ7vzwt2QeOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9=zHBmOApsqa=UZcKtg1cH0tp34Kt9_5AEJ7vzwt2QeOA@mail.gmail.com>

On Sat 2025-03-08 07:52:49, Tamir Duberstein wrote:
> On Sat, Mar 8, 2025 at 7:51 AM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > On Fri, Mar 7, 2025 at 11:49 PM Kees Cook <kees@kernel.org> wrote:
> > >
> > > On Fri, Mar 07, 2025 at 05:08:55PM -0500, Tamir Duberstein wrote:
> > > > This is one of just 3 remaining "Test Module" kselftests (the others
> > > > being bitmap and scanf), the rest having been converted to KUnit.
> > > >
> > > > I tested this using:
> > > >
> > > > $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf
> > > >
> > > > I have also sent out a series converting scanf[0].
> > > >
> > > > Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]
> > > >
> > > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > > > ---
> > > > Changes in v6:
> > > > - Use __printf correctly on `__test`. (Petr Mladek)
> > > > - Rebase on linux-next.
> > >
> > > Thanks for doing this!
> > >
> > > If Petr, Rasmus, Andy, and/or others Ack this I can carry it in my
> > > "lib/ kunit tests move to lib/tests/" tree, as that's where all the
> > > infrastructure in lib/tests/ exists.
> >
> > I think the plan is to take it through the printk tree.

It would be much easier when Kees takes it together with the move
to lib/texts. It causes several conflicts...

Kees, could you take it, please?

Note that %pGg test currently fails in linux-next. It is a regression caused
by a change in tracing code and should be fixed in the tracing code,
see https://lore.kernel.org/all/Z9L5HsVzQ0bVZtjp@pathway.suse.cz/

Best Regards,
Petr
