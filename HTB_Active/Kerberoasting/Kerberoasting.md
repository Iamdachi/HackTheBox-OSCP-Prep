# Some definitions because there are tons

Kerberos - auth protocol
Kerberoasting - attack on Kerberos Targets: service accounts
DC - Domain Controller
system service - accounts tied to a Service Principal Name (SPN), like a SQL Server or web service. Requires: valid domain credentials already (any low-privilege authenticated user works).
KDC - Key Distribution Center — the core component of Kerberos authentication
TGS - Kerberos service ticket
SPN - Service Principal Name
Kerberos preauthentication - is a security check the KDC performs before issuing a TGT, to confirm the requester actually knows the account's password — not just its username.
AS-REP - Authentication Service Response - 
TGT - Ticket Granting Ticket
session key - temporary, symmetric encryption key that Kerberos generates fresh for each authentication session, used to secure communication between two parties without reusing long-term secrets like password hashes.
AS-REP Roasting - Targets: user accounts with Kerberos pre-authentication disabled (UF_DONT_REQUIRE_PREAUTH flag).


# Whole flow shortly

Password → AS-REQ (with pre-auth) → KDC validates
        → AS-REP contains TGT (encrypted with krbtgt hash)
        → Present TGT to KDC's TGS → get TGS/service ticket (encrypted with service account hash)
        → Present service ticket to the actual service → access granted
