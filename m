Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D21DA60F
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072601; cv=none; b=rixnk17+iXeF6L3S5+ARkEjxy6wM3pDtSbL54GVt72JOeb1PuN5pdNBNGQXWqX++lNTl+dp8Yx710AvT47XEg0XAxOF1uAWJIGQQLvFoyyAnuOzPRUomFlIyA9JiYHLXwnq/+oSBCOjGSOnuI3wCpfuYSMHB9abXTRWKfqjarjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072601; c=relaxed/simple;
	bh=LDKkQVKkjKtpLJyKrzYI0mn8EaUxHRvqMn9otOZY6cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q02QAvutm11f4s7adG+TEF0hJ2cvBkLGKyJSmWczyw62sIkq+Q1+OsYCCbxaaFNLPOoqAcjchlHCit2EVEYe9d0FxBA1UB8Tthpgi+GPu+dhs5qSJrNzT8vZHmtyWVr6w66Gwc7kl0ET8jrJvXE/w2ynkmcae+AS3sixO+87l8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu; spf=pass smtp.mailfrom=vivier.eu; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivier.eu
Received: from [192.168.100.100] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MnJdE-1v7qZk3Roq-00hQOM; Mon, 16 Jun 2025 13:16:36 +0200
Message-ID: <9d69c687-465b-4819-8576-d60d7735fc6b@vivier.eu>
Date: Mon, 16 Jun 2025 13:16:36 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu>
 <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu>
 <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
 <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de>
 <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
 <CAMuHMdUH3zfrxSV9UqxnG1dEnHA_SmeYVsmKzV3kzYq6TLnucg@mail.gmail.com>
 <f869d1238c15875a29f4cdf7569c176ba81fd6c4.camel@physik.fu-berlin.de>
 <52a181ca-a6fa-4f1a-9344-3e809a036cfa@vivier.eu>
 <a88f88d647aa116ae324d4897928adb82b466d65.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <a88f88d647aa116ae324d4897928adb82b466d65.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:jTlipUSq2Zn3XrbQU+IMa7EeFfS3//62qi+R3Yx1i4An8WXPNHy
 XL+XwQ+nMhnvmGWctASYfpSqmwBzdP1WMmrzNWdCRWrh0+np9eVuo8ZzV70Pz+Qicqkvfj5
 r1pghSdHgNY0uftcq7N3d3NQ6VgVncEEZ2Gbq2j5TaJQaghqPqGacxmcl33KGBtJI8T1wJs
 nxWl+FWepYSwLxrN/hWsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iKWCB5YjMCY=;S4a31X4w30h9wyh315UU8OwTZ33
 s2YDJbrvdHHMY1S91D3e35T4RRhS27HtcSZbo6Sc0csH02+/6azbqzw/hgGimqsBMAZy2U1Ft
 vCDnQuJJXHTHQkiQFqyUhInHF188EAKbFTI4jFtpmhJfk6Di+WxDbEv2sSBB4kb2NqPOrJTSx
 geGER6mnWzoym2ArgOgpjDIUSOfEKCSiJlYkn0dSiW9TPDrG5Es4JkM+vzp9WXQNKO529XwWb
 oM2BwIYe4zBJ6mOupnIG7f5osdslGzRTFxoFhTV0+rZ3/TpzKJBipH0k719bMremu1HqSoR9R
 RSqDTTk4OKNgOGEx9mqQ/usANjf+HshyB8lEVuGpwnbQanYfsmleEuNZvmrulhScpbjWvegMU
 4NslntVQkV5Cr69OwdwQYKheFnpyMj6lkPPS0hwlhJsggqPHwt2MEHWcGCbMPYHXsqOqXnckL
 IKKT5Ut+ok8gR3hqFuHURHQUyD9klcp4VrZbc3ClcUNql5uC1Xn3LUjTRqmR3xrwhywRWbjeN
 tKa2QFwvuUhcY2xsPJG7eacYupqiVGvYU8C2PZlnNRBc1SwTDEMsqKwBDp92GcRrfwXc2oYQJ
 zMSwW8ZWfIbWiZcctBRk6bIJN14P+JW5gsQkvXZf3TfAQ7zPR48FbGsqQtrH73LZDY8rAGByb
 Rcfc8lYbsMMHXDtnzLwXaEt2j6lub/F4jAcnQ9VGHc01EUqs/5kNyjwWduvGpLRC4eVuJ8PJ6
 CRE/oDlg7+BJKTzvlGHv3zM/lY0AKUODLS+aH4J2GHXzGjx68HxBYbiQeEQaUCKDriYEkeVjg
 7Z7dN5E0VMFm5DGdPihKHpsj+1/24uCdaCyOh/sRho6lqB6ixYS7ICrsVO23QOMbQd+Fg1cfm
 qWnUCWLTN1gBvtrvhzBBZDJa0XO1AXagChfMoqRpg1Y3XClD4BEimYIxk3haDB8Wrku7Z1D7n
 SZ5nmUSRb3PzZCJ167X0yJjMXCPRGiSfh+0u66j6K19Mw+gHSoNwrD0MW7oP1vTXNX3ghsRLi
 BsAD1YlGw0KyOvaOAzc1jLGRhY9bV8kWDezIgWcfTSs0JZanf+uyKvVLSbk52gVqScjYkLShf
 3CWreZgp2O+2t6ZhhXADqJhzXjzz97suVAkhgJgaLePvBDNC1ONhthxE54CYhCCHNCHBjRmWm
 nzhma+hqdwX/icLWOVVmuOi7KgizZVV7nBVXyOJE92p0XiAx8bTImpgrUnDmszNTYBV3R/mMC
 VbycSMvdjn9rMccazOOdD7d1gU7BezY6aFfgR+UG3BsPT8+/PJ1bXrhM59aNRS3/vbbEtJGj7
 OXBZbk0ZPxSkqMTnU50m/79aRQnBD/thaiCfXW3NmtxAC+ClwAVSyaD7TRwRcWC6PBYlnpE+N
 4MXmKYjuWEgulVEkLPPJ22bkJg9f9/i17Us1U=

On 16/06/2025 13:10, John Paul Adrian Glaubitz wrote:
> On Mon, 2025-06-16 at 13:05 +0200, Laurent Vivier wrote:
>> I think an e_flags with a new value like EF_M68K_ABI2 would be more appropriate.
> 
> How is it currently used on m68k and does QEMU use it? I think that would be
> certainly a way to go.
> 

It's not used by m68k.

It's only used by MIPS.

In QEMU see linux-user/elfload.c:

#ifdef TARGET_ABI_MIPSN32
#define elf_check_abi(x) ((x) & EF_MIPS_ABI2)
#else
#define elf_check_abi(x) (!((x) & EF_MIPS_ABI2))
#endif

#ifndef elf_check_abi
#define elf_check_abi(x) (1)
#endif

/* Verify the portions of EHDR outside of E_IDENT for the target.
    This has to wait until after bswapping the header.  */
static bool elf_check_ehdr(struct elfhdr *ehdr)
{
     return (elf_check_arch(ehdr->e_machine)
             && elf_check_abi(ehdr->e_flags)
             && ehdr->e_ehsize == sizeof(struct elfhdr)
             && ehdr->e_phentsize == sizeof(struct elf_phdr)
             && (ehdr->e_type == ET_EXEC || ehdr->e_type == ET_DYN));
}
...

static void load_elf_image(const char *image_name, const ImageSource *src,
                            struct image_info *info, struct elfhdr *ehdr,
                            char **pinterp_name)
...
     if (!elf_check_ehdr(ehdr)) {
         error_setg(&err, "Invalid ELF image for this architecture");
         goto exit_errmsg;
     }
...

Thanks,
Laurent
