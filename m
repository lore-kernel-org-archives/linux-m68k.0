Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902943;
	b=eOUUhcvFsV4rNQQc/gfXwwy2I+bQnXEJskYH7TL6vQqWhh2IsszUUBvW7Gpnk1v24K/1
	 7qyhEBYj/nzU+H6qIY2ThIWjpeRjx/WhhG/v7I8EsstLo0eJ+8yKdwDo02klsAJGQMokE
	 O0CmszljV5bPcuIRbPr7wpIwenD5DsLV1JLB7vk0paPcA0YAKFvtU+U32mOpPhUyJyE6Y
	 2fKAxKBKjolcvhOX3EifjMAvvhxI8sFStLZSoNqNx5yBbls+tWTNv1QfmIUnUOh2NvIYo
	 Ox6CbT3Jl1oRohZx4b7alnlR4bukH1hO04Uc1QyODPZqiaE5twOkxxsVPU3X/d+uY5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902943;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=+9sUIDbNvshIjQqNuwUL4QpX4Yb1SSwe6eGpxFYy7JY=;
	b=QYTOzJcjvTXguNR5WUJKzRXHKCk9AKZsMOiAh27XSMpwZEHT73L3naq0wbprfoS2w+On
	 bXw1kD0w35YliDxAccT1MJoRD9ip7CvUKozefns9ODHPvX9SstzEpB9a29zidZJVEEJgn
	 zb/eTqSuOuDarn7XUmLGvBWkajNmRRtnqFavlbqNBhfENX/E7gLwXwbFcUMT1X64cLxo0
	 sb5JMC+ZpkgaqnFQOZ14W383XfPqPFi1feIoK3pvLtR6F7bjC3/5De+YEe3Qva9JTEaRk
	 Ni+BymSuMqhKA5tSVMfD7JYhTYWb9wopnpsMufwGtkFvtudaIllM4ntuWMwU1coRb2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=No8bXYa8;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D848A606A336
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 18:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D848A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=No8bXYa8
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D17BD60145;
	Thu,  5 Nov 2026 18:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2916C1F000C1;
	Thu,  5 Nov 2026 18:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902941;
	bh=+9sUIDbNvshIjQqNuwUL4QpX4Yb1SSwe6eGpxFYy7JY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=No8bXYa8bSpobc76HbXi25IE8BNIKh5igOIIhXUUxQlCHHgcWaje1QvQ+oTivdzcq
	 1bDi+LXpxsqV2zR9kjWlCYMFC7duLQLbBfumN6HMyOGglT7CpVvnSYIQv2JWrTveBt
	 OhAmcUsXXnO37VTTxAaiPlUCVXUxFhxLsdvM1SMvtXPDQFUwAyxOm9KbQyVMu8mOht
	 vlvy42B+mPYCc778hdpMK0Qp+LgYk4uGaJgcVDBdXp+yataOpcZ1GW+7m4T/TbWwW1
	 xPjyddQofCHJEAk42uk2hzt7SUkuscGKGHR7u739uoy+3U6aFGCOuYTHbMKGEkmb2C
	 mKFKhUqn2a4Jw==
Message-ID: <sashiko-outbox-199744@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/11] kbuild: implement and use depcheck to check
 dependency timestamps
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TG9yZW56byBTdG9ha2VzIChBUk0p?= <ljs@kernel.org>, "Linus
 Torvalds" <torvalds@linux-foundation.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, "Luis Chamberlain" <mcgrof@kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez" <da.gomez@kernel.org>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Aaron Tomlin" <atomlin@atomlin.com>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Benno
 Lossin" <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir
 Duberstein" <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?b?T251ciDDlnprYW4=?= <work@onurozkan.dev>
Cc: linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org
In-Reply-To: <20261104-build-speedup-v5-2-0f6018be8dae@kernel.org>
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-2-0f6018be8dae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 18:22:19 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] kbuild: missing fixdep prerequisite for depcheck in scripts/basi=
c/Makefile
- [Medium] kbuild: concurrent Makefile.build runs race on .depcheck.mk.tmp =
and .depcheck.mk
- [Low] kbuild: install-extmod-build leaves .depcheck.mk files in packaged =
trees
--

commit f2af2ee8757f13fb26fb18de8c51c7a2f612cd46
Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>

kbuild: implement and use depcheck to check dependency timestamps

This commit introduces scripts/basic/depcheck to check header dependency
timestamps in C and emit a condensed .depcheck.mk fragment containing only
saved command lines for up-to-date targets. scripts/Makefile.build runs
depcheck before including .cmd files, falling back to the original .cmd
files if depcheck fails.

> diff --git a/Makefile b/Makefile
> index f895752d4b05f..d92a5d78b4659 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2252,6 +2252,7 @@ clean: $(clean-dirs)
>  	$(call cmd,rmfiles)
>  	@find . $(RCS_FIND_IGNORE) \
>  		\( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cmd'=
 \
> +		-o -name '.depcheck.mk' -o -name '.depcheck.mk.tmp' \
>  		-o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
>  		-o -name '*.dtb' -o -name '*.dtbo' \
>  		-o -name '*.dtb.S' -o -name '*.dtbo.S' \

[Severity: Low]
While the top-level clean target removes .depcheck.mk and .depcheck.mk.tmp
alongside .*.cmd, scripts/package/install-extmod-build only deletes .*.cmd
and *.o after copying and rebuilding scripts/ for external module packaging:

scripts/package/install-extmod-build:
	find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete

When modules_prepare or the cross-compilation step in install-extmod-build
invokes $(MAKE) $(build)=3Dscripts, depcheck generates .depcheck.mk files
under scripts/. Should scripts/package/install-extmod-build also remove
.depcheck.mk and .depcheck.mk.tmp so those build artifacts are not left in
packaged kernel-devel and linux-headers trees?

> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index bbe9555c47a8b..7b652f169a8fd 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -613,7 +613,20 @@ $(obj)/: $(if $(KBUILD_BUILTIN), $(targets-for-built=
in)) \
> =20
>  existing-targets :=3D $(wildcard $(sort $(targets)))
> =20
> --include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
> +cmd-files :=3D $(wildcard $(foreach f,$(existing-targets),$(dir $(f)).$(=
notdir $(f)).cmd))
> +
> +# depcheck checks timestamps first and outputs only saved command lines =
of
> +# up-to-date targets, falling back to .cmd files if it fails. A directory
> +# whose targets all lie elsewhere may not exist in the output tree.
> +depcheck :=3D $(wildcard $(objtree)/scripts/basic/depcheck)
> +
> +ifneq ($(and $(depcheck),$(cmd-files),$(wildcard $(obj))),)
> +ifeq ($(shell $(depcheck) $(obj)/.depcheck.mk $(cmd-files) && echo ok),o=
k)
> +cmd-files :=3D $(obj)/.depcheck.mk
> +endif
> +endif
> +
> +-include $(cmd-files)

[ ... ]

> diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
> index fb8e2c38fbc78..ff98780e474d9 100644
> --- a/scripts/basic/Makefile
> +++ b/scripts/basic/Makefile
> @@ -2,7 +2,7 @@
>  #
>  # fixdep: used to generate dependency information during build process
> =20
> -hostprogs-always-y	+=3D fixdep
> +hostprogs-always-y	+=3D fixdep depcheck

[Severity: Medium]
Can a parallel build from a clean tree fail when building depcheck before
fixdep is ready?

Both fixdep and depcheck are single-file host programs built by the
host-csingle rule in scripts/Makefile.host:

$(host-csingle): $(obj)/%: $(obj)/%.c FORCE
	$(call if_changed_dep,host-csingle)

which expands cmd_and_fixdep in scripts/Kbuild.include:

cmd_and_fixdep =3D                                                         =
    \
	$(cmd);                                                              \
	$(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target=
).cmd;\
	rm -f $(depfile)

Without an explicit prerequisite ordering $(obj)/depcheck after
$(obj)/fixdep, make -jN can compile fixdep and depcheck concurrently during
scripts_basic. If depcheck finishes compiling before fixdep has finished
linking, cmd_and_fixdep will attempt to execute scripts/basic/fixdep while
it does not yet exist or is still open for writing.

Should scripts/basic/Makefile declare that $(obj)/depcheck depends on
$(obj)/fixdep?

> diff --git a/scripts/basic/depcheck.c b/scripts/basic/depcheck.c
> new file mode 100644
> index 0000000000000..119075353f3bc
> --- /dev/null
> +++ b/scripts/basic/depcheck.c

[ ... ]

> +int main(int argc, char **argv)
> +{
> +	char tmp_path[PATH_MAX];
> +	FILE *out;
> +	int i;
> +
> +	if (argc < 2) {
> +		fprintf(stderr, "usage: %s <output> <.cmd files...>\n", argv[0]);
> +		return 1;
> +	}
> +
> +	if (snprintf(tmp_path, sizeof(tmp_path), "%s.tmp", argv[1]) >=3D
> +	    (int)sizeof(tmp_path)) {
> +		fprintf(stderr, "%s: path too long\n", argv[1]);
> +		return 1;
> +	}
> +
> +	out =3D fopen(tmp_path, "w");
> +	if (!out) {
> +		perror(tmp_path);
> +		return 1;
> +	}
> +
> +	for (i =3D 2; i < argc; i++) {
> +		char target[PATH_MAX];
> +
> +		if (target_of(argv[i], target, sizeof(target)))
> +			add_target(target);
> +	}
> +
> +	for (i =3D 2; i < argc; i++)
> +		process(out, argv[i]);
> +
> +	/* Write errors are latched in the stream, so one check at the end cove=
rs them all. */
> +	if (ferror(out) || fclose(out) || rename(tmp_path, argv[1])) {
> +		perror(argv[1]);
> +		unlink(tmp_path);
> +		return 1;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
What happens if two concurrent sub-makes enter the same directory during a
parallel build?

For example, when CONFIG_HEADERS_INSTALL=3Dy (such as in allmodconfig), the
prepare target depends on both prepare0 -> archprepare -> scripts and
headers -> scripts_unifdef without an ordering dependency between them:

Makefile:
scripts: scripts_basic scripts_dtc
	$(Q)$(MAKE) $(build)=3D$(@)
...
scripts_unifdef: scripts_basic
	$(Q)$(MAKE) $(build)=3Dscripts scripts/unifdef

Similarly, on microblaze with CONFIG_OF_EARLY_FLATTREE=3Dy, the default bui=
ld
enters arch/microblaze/boot/dts via both vmlinux (with need-builtin=3D1) and
dtbs (with need-dtbslist=3D1) in parallel.

When both sub-makes parse scripts/Makefile.build for the same $(obj)
directory concurrently, two depcheck processes open the same
$(obj)/.depcheck.mk.tmp path with fopen(tmp_path, "w"). One process can
truncate and overwrite the shared .depcheck.mk.tmp file while the other is
writing to it, and the first process to finish will rename the truncated or
interleaved file to $(obj)/.depcheck.mk and return 0 (causing make to
include a corrupted makefile fragment), while the second process fails in
rename() with ENOENT and prints an error via perror(argv[1]). In addition,
when the two sub-makes have different $(targets) sets, one sub-make can
overwrite $(obj)/.depcheck.mk before the other sub-make includes it.

Could this race corrupt the generated makefile fragment during parallel
incremental or no-op builds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-build-spee=
dup-v5-0-0f6018be8dae@kernel.org?part=3D2
