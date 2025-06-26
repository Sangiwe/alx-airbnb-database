# Airbnb Clone - Sample Data 

This directory contains SQL scripts to populate the database with realistic sample data.

## Dataset Overview
| Table       | Records Inserted | Key Features                          |
|-------------|------------------|---------------------------------------|
| User        | 5                | 2 hosts, 2 guests, 1 admin            |
| Property    | 3                | Beach villa, downtown loft, cabin     |
| Booking     | 4                | Mix of confirmed/pending statuses     |
| Payment     | 2                | Linked to confirmed bookings          |
| Review      | 2                | Ratings 4-5 with detailed comments    |
| Message     | 2                | Host-guest conversations              |

## Usage
1. Run the seed script:
   ```bash
   mysql -u root -p < seed.sql